# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy
pkgver=1.940
_pkgextraver=202405270005_70454654f
pkgrel=1
pkgdesc="Peer to peer search engine"
arch=('any')
url=https://yacy.net/
license=('GPL-2.0-only')
depends=('java-runtime>=11')
install=yacy.install
source=("https://download.yacy.net/yacy_v${pkgver}_${_pkgextraver}.tar.gz"
        'yacy.sh'
        'yacy.service')
options=(!emptydirs)
sha512sums=('21f63250a9634a7ed41940c6acaf7feb677012b9344b7e56d173849981232bc4ed56e2f66565dbdacf6034d37de99bbbf228ec1cb6c7848b2a0843020f6e57aa'
            '61dc598b975afdbbb1cab1f3aff304747cc3544f0f35d5f6a26d80aa71fcfb9f013f8f1054410eae9870c1472b4aacbef4b28ad9400b9591263c9f6adaa0971d'
            '754b6224ef2a640cbfb50a3d46e92c04955dac3e683239872d2a5c9ba92016a1511c6049903322dd8a21e6d2cc51e2f4e9bd3339b4ef4aada68ae20b3acc189b')

package() {
	cd "$srcdir/$pkgname"

	# Install to /usr/share/yacy
	install -dm755 "$pkgdir/usr/share/yacy"
	cp -r htroot defaults lib locales skins langdetect "$pkgdir/usr/share/yacy/"
	install -Dm644 gpl.txt "$pkgdir/usr/share/yacy/gpl.txt"

	# Install JARs to /usr/share/java/yacy for compatibility
	install -dm755 "$pkgdir/usr/share/java/yacy"
	install -m644 lib/*.jar "$pkgdir/usr/share/java/yacy/"

	# Install wrapper script and service
	install -Dm755 "$srcdir/yacy.sh" "$pkgdir/opt/yacy/yacy"
	install -Dm644 "$srcdir/yacy.service" "$pkgdir/usr/lib/systemd/system/yacy.service"
}

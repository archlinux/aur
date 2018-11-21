# Maintainer: Hannes Eichblatt <lists@hanneseichblatt.de>
pkgname='wifijammer-git' # '-bzr', '-git', '-hg' or '-svn'
pkgver=r90.ac12bbe
pkgrel=1
pkgdesc="Continuously jam all wifi clients and access points within range."
arch=("x86_64")
url="https://github.com/DanMcInerney/wifijammer"
license=('BSD')
groups=()
depends=('python2-scapy' 'python2')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=(${pkgname}'::git+https://github.com/DanMcInerney/wifijammer.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	/usr/bin/install -D -m 744 ./wifijammer ${pkgdir}/usr/bin/wifijammer
	/usr/bin/install -D -m 644 ./README.md ${pkgdir}/usr/share/doc/${pkgname%-VCS}/README.md
	/usr/bin/grep -A 100000 -e "^License$" README.md > ${pkgdir}/usr/share/doc/${pkgname%-VCS}/LICENSE.md
}

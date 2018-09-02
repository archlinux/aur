# Maintainer: Ainola
# Contributor: Florian Bruhin
# Contributor: Eric Anderson

pkgname=hib-dlagent
pkgver=0.7
pkgrel=2
pkgdesc='Tool to download Humble Indie Bundle binaries by file name'
arch=('any')
url='https://github.com/hagabaka/hib-dlagent'
license=('GPL2')
depends=('bash' 'curl' 'python-humblebundle')
optdepends=('gnome-keyring-query: encrypted account password support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hagabaka/hib-dlagent/archive/$pkgver.tar.gz"
        "none-url.patch::https://github.com/hagabaka/hib-dlagent/commit/f4c40f6d02094f9ecb46d956265977284e8f3acb.patch")
sha256sums=('2b6aa4e98e8e525a821843de4df5db890882eb8d20c09d7b30639e4c747ddc4e'
            '3598dc291cb249cffb522b914de162218776f24f9f470a37dd472d7d74987127')

prepare() {
    patch -d "$pkgname-$pkgver" -p1 < none-url.patch
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 README -t "$pkgdir/usr/share/doc/hib-dlagent/"
    install -Dm755 hib-dlagent -t "$pkgdir/usr/bin/"
    install -Dm755 discover-url.py -t "$pkgdir/usr/share/hib-dlagent/"
}

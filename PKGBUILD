# Maintainer: Mads Ravn <https://github.com/madsravn>
# Contributor: Antoni Kepinski <a[at]kepinski[dot]me>
pkgname=archfetch
pkgver=1.0.8
pkgrel=7
_commit=47ee3d8c3d9ad4c8585347a39d021f395cabaecb # pick last commit
pkgdesc="Simple CLI system information tool for Arch Linux."
url="https://github.com/xxczaki/archfetch/"
arch=('any')
license=('MIT')
makedepends=('git')
source=("git+https://github.com/xxczaki/archfetch#commit=$_commit")
sha256sums=('SKIP')

prepare() {
    cd $pkgname
    # use systemd's hostnamectl instead of inetutils
    sed -i 's/(hostname)/(hostnamectl hostname)/' archfetch
    # fix awk warning
    sed -i 's/\\"/"/g' archfetch
}

package() {
    cd $pkgname
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=libretiny
pkgname=ltchiptool-data
pkgver=1.4.0
# lightweight tag -> tag is not signed, only the commit
_commit=c81bc9cef83ffd42fcffce32b8b08793b2400b9f
pkgrel=1
pkgdesc="LibreTiny board/family data snapshot for ltchiptool"
arch=('any')
url="https://docs.libretiny.eu"
license=('MIT')
makedepends=('git' 'python')
validpgpkeys=('A874B6246D23954F506CC60C43037AC62A600562') # Kuba Szczodrzyński <kuba [this: @] szczodrzynski [and a dot] pl>

source=("${_srcname}-${pkgver}::git+https://github.com/libretiny-eu/libretiny.git#commit=$_commit?signed")
b2sums=('SKIP')

package()
{
    cd $_srcname-$pkgver
    local python_site=$(python -c 'import site; print(site.getsitepackages()[0])')
    local dst=$pkgdir/$python_site/ltchiptool

#    install -d $dst/boards/_base

    install -Dm644 platform.json $dst/
    install -Dm644 families.json  $dst/

    find boards/ -name \*.json -exec install -Dm644 {} $dst/{} \;

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT"
}

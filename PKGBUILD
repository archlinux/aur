# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="pyluach"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="Pyluach is a Python package for manipulating Hebrew dates, Gregorian-Hebrew calendar conversions, and other Jewish calendar related calculations"
pkgver="1.3.0"
pkgrel=2
url="https://github.com/simlist/pyluach"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE"
        "description.patch")
sha256sums=('9cf95eaa600cc904d1adb015036ab135e0d732ca2a30253db92b676ee3415dea'
            'a6900a379815872f27df1aac58d8c249ddd085259f6bab6768e162cc82d346b1'
            'a8cac8390ac0f48ee0b4424bbc3e431d94efd56658d8615e0a065737c1e1cd73')

prepare() {
  patch -Np1 -i description.patch
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package_python-pyluach(){
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

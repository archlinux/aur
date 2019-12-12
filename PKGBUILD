# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="habitipy"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="A set of scripts to interact with Habitica"
pkgver="0.3.0"
pkgrel=2
url="https://github.com/ASMfreaK/habitipy"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
"LICENSE")
sha256sums=('6b2d01eab4da0b2b78280ce0f670c5f7b4c249e1b0794e544fa1f2f4d07ec2a3'
            '677a082f39faca4187bd171ae13be0ad128f413e82b159994a8ba412cd33a5f9')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-habitipy(){
    depends=("python-pbr"
             "python-requests"
             "python-plumbum")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

package_python2-habitipy(){
    depends=("python2-pbr"
             "python2-requests"
             "python2-plumbum")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

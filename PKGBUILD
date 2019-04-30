# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
pkgname=amdgpu-tweakd-git
pkgver=0.1.dev39+g6dd3cb0
pkgrel=1
pkgdesc='amdgpu fan speed control and power limit tweak'
provides=('amdgpu-tweakd')
conflicts=('amdgpu-tweakd')
arch=('any')
depends=('python-jeepney' 'python-pyudev')
makedepends=('git' 'python-setuptools-scm')
source=("${pkgname}::git+https://github.com/amezin/amdgpu-tweakd.git")
md5sums=('SKIP')
backup=('etc/amdgpu-tweakd')
license=('GPL3')

pkgver() {
    cd $pkgname
    python setup.py --version
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1 --skip-build

    install -dm755 "${pkgdir}/usr/share/doc/amdgpu-tweakd"
    install -Dm644 config.example "${pkgdir}/usr/share/doc/amdgpu-tweakd/config.example"
    install -Dm644 config.example "${pkgdir}/etc/amdgpu-tweakd"
}

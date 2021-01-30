# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ros-cross-compile
_name=${pkgname:7}
__name=$(echo $_name | tr '-' '_')
pkgver=0.6.0
pkgrel=2
pkgdesc="A tool to build ROS workspaces for various target architectures and platforms."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
depends=('docker' 'qemu-user-static' 'cmake' 'git' 'wget' 'aarch64-linux-gnu-gcc' 'arm-linux-gnueabihf-gcc' 'arm-linux-gnueabihf-gcc-stage1' 'arm-linux-gnueabihf-gcc-stage2' 'aarch64-linux-gnu-pkg-config' 'python-vcstool' 'python-colcon-common-extensions')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${__name}/${__name}-$pkgver.tar.gz)
sha256sums=('b0c20cf9ddebccd66f10a6c471eec93d7c0c9d8a177232db5de02c171393b085')

package() {
    cd ${srcdir}/${__name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

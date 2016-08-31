# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.11.1
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz")
sha512sums=('a8e0b857e180e042e94e8587c320f519e6739fa82ec2fedc4a9d75747db6ba463a573c3bfe4265afd253561966233dc477b1beb5425c8501e0e76736519c608f')


build() {
  cd "$srcdir/conan-$pkgver"
  python setup.py build
}

package() {
  depends=('python-pyjwt>=1.4.0' 'python-pyjwt<1.5.0'
           'python-requests>=2.7.0' 'python-requests<2.12.0'
           'python-colorama>=0.3.3' 'python-colorama<0.4.0'
           'python-passlib>=1.6.5' 'python-passlib<1.7.0'
           'python-boto>=2.38.0' 'python-boto<2.43.0'
           'python-yaml>=3.11' 'python-yaml<3.13.0'
           'python-patch=1.16'
           'python-fasteners>=0.14.1'
           'python-six>=1.10.0'
           'python-bottle>=0.12.8' 'python-bottle<0.13')

  cd "$srcdir/conan-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
}

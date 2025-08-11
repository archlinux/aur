# Maintainer: Tarn W. Burton <twburton@gmail.com>

pkgname=ocicl
pkgver=2.6.5
pkgrel=2
pkgdesc='OCI-based ASDF system distribution and management tool for Common Lisp'
arch=('any')
url='https://github.com/ocicl/ocicl'
license=('MIT')
depends=('sbcl')
provides=('ocicl')
options=('!strip')
source=("https://github.com/ocicl/ocicl/archive/refs/tags/v${pkgver}.tar.gz"
        "build.lisp"
        "ocicl")
sha512sums=('5a4d949fa88e5ea42111681e46b8baa66d17108e5959b59232dae1fe1e6138e13edb5dbceac1cd3798fb1814f1afb779f7122620e50fbcf74830e265f577794e'
            'c47e4c5ccaf5b89ad018e94ade68a4861773b7080205f7379bfbc73a87657c199fa8d0eff3a94525ce318f639c99902ab241b855cea76d29cef056038cb5505e'
            '0397db5e37e3c3892854122a83915d5837cb669686c43a4451fa77e2065a601fbc95ecd58f9884b8d8c94f8782eb0f2c454a5310043b82dc6bc7171bc10a20c9')

build() {
  cd "ocicl-${pkgver}"
  sed -i "s/include-git-p t/include-git-p nil/g" ocicl.lisp
  sbcl --dynamic-space-size 3072 --no-userinit --load ../build.lisp
}

package() {
  install -Dm755 ocicl "${pkgdir}/usr/bin/ocicl"
  cd "ocicl-${pkgver}"
  install -Dm644 ocicl.core "${pkgdir}/usr/lib/ocicl/ocicl.core"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

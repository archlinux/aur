# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-conctl'
pkgdesc='Commands for managing concrnt'
pkgver=1.0.1
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-gateway')
makedepends=('go')

source=("${pkgname}-${pkgver}::https://github.com/concrnt/conctl/archive/refs/tags/${_pkgver}.tar.gz"
        "https://raw.githubusercontent.com/concrnt/conctl/c258e389c7e606d92b155fc7369220155ed7af3e/LICENSE")

sha512sums=('42b4dbb34407887123b647a99fcd10190c45d72a80ef5179e69b3c0f4c44bf92fc5697fa6c58abcbff6822e3598db8da024cf0376ebcdc8203f8a483f859c39c'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')

build() {
  cd "${srcdir}/conctl-${pkgver}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go mod download
  go build -o conctl .
}

package() {
  install -Dm755 "${srcdir}/conctl-${pkgver}/conctl" "${pkgdir}/usr/bin/conctl"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

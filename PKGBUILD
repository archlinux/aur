# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-conctl'
pkgdesc='Commands for managing concrnt'
pkgver=1.0.1
_pkgver=v${pkgver}
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-api')
makedepends=('go')

source=("${pkgname}-${pkgver}::https://github.com/concrnt/conctl/archive/refs/tags/${_pkgver}.tar.gz"
        "https://raw.githubusercontent.com/concrnt/conctl/c258e389c7e606d92b155fc7369220155ed7af3e/LICENSE")

sha512sums=('42b4dbb34407887123b647a99fcd10190c45d72a80ef5179e69b3c0f4c44bf92fc5697fa6c58abcbff6822e3598db8da024cf0376ebcdc8203f8a483f859c39c'
            'c77829c40fe3a98353b39509d75397647810b0a38c5122078c661801bb5d417382db3889240dcafa4da87906365f77876138de74c2afd789b7ad5c93f06765e0')

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

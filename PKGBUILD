# Maintainer: Verivus Pty Ltd <hello@sqry.dev>
pkgname=sqry-bin
pkgver=4.8.16
pkgrel=1
pkgdesc='Semantic code search tool'
arch=('x86_64' 'aarch64')
url='https://sqry.dev'
license=('MIT')
provides=('sqry')
conflicts=('sqry')

source_x86_64=("sqry-${pkgver}-x86_64::https://github.com/verivus-oss/sqry/releases/download/v4.8.16/sqry-linux-x86_64")
source_aarch64=("sqry-${pkgver}-aarch64::https://github.com/verivus-oss/sqry/releases/download/v4.8.16/sqry-linux-arm64")
sha256sums_x86_64=('12b8bb6327c386804a7c21a303b5312a0d38640d12f46956b7926358e935f284')
sha256sums_aarch64=('6876d83b4974ceed8bb898a8f0eabc1f0eaf795a9523877058393968c526b3c2')

package() {
  local binary
  case "${CARCH}" in
    x86_64)
      binary="${srcdir}/sqry-${pkgver}-x86_64"
      ;;
    aarch64)
      binary="${srcdir}/sqry-${pkgver}-aarch64"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm755 "${binary}" "${pkgdir}/usr/bin/sqry"
}

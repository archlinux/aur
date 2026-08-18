# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=byparr
_name=Byparr
pkgver=3.0.4
pkgrel=1
pkgdesc="A Python based proxy that greatly increases the chance challenges will be bypassed."
arch=('any')
url="https://github.com/ThePhaseless/Byparr"
license=('GPL')
depends=(
  'python'
  'python-uv'
  'python-aiofiles'
  'python-fastapi'
  'python-camoufox'
  'python-playwright-captcha'
  'python-pydantic'
  'python-2captcha'
  'python-httpx'
  'python-browserforge'
  'python-apify-fingerprint-datapoints'
  'python-screeninfo'
  'python-ua-parser'
  'python-ua-parser-builtins'
  'python-language-tags'
)
makedepends=(python-build python-installer python-wheel)

source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
        'byparr.service'
        'byparr.sysusers')

sha256sums=('e71246efb5e6908f1297efc98b97793f406b404eb8248682f6be1aa458d44bb9'
            '270d7b655db58366d6ec533aa7565e8eaf685adbcb7e0bf17548ca505aed2d31'
            '3c332dc86e413980402663b57f35653b34047d9d01d069b35c15cf60e68ee5d2')

package() {
  cd "${srcdir}/Byparr-${pkgver}"

  install -D -m 755 main.py "${pkgdir}/usr/lib/byparr/main.py"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/byparr/LICENSE"

  cp -a icon/ src/ tests/ "${pkgdir}/usr/lib/byparr/"

  install -D -m 644 "${srcdir}/byparr.service" "${pkgdir}/usr/lib/systemd/system/byparr.service"
  install -D -m 644 "${srcdir}/byparr.sysusers" "${pkgdir}/usr/lib/sysusers.d/byparr.conf"
}

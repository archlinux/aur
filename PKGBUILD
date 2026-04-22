# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=byparr
_name=Byparr
pkgver=2.1.0
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

sha256sums=('59e9bbc95bc8e76986f0018a284769f292da30ff589e723e50b7e34cea04f10c'
            '78559285099a0909d5f52b3a3b2a5e97d755112ba3f55a25881a2fce0efd7946'
            '3c332dc86e413980402663b57f35653b34047d9d01d069b35c15cf60e68ee5d2')

package() {
  cd "${srcdir}/Byparr-${pkgver}"

  install -D -m 755 main.py "${pkgdir}/usr/lib/byparr/main.py"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/byparr/LICENSE"

  cp -a icon/ src/ tests/ "${pkgdir}/usr/lib/byparr/"

  install -D -m 644 "${srcdir}/byparr.service" "${pkgdir}/usr/lib/systemd/system/byparr.service"
  install -D -m 644 "${srcdir}/byparr.sysusers" "${pkgdir}/usr/lib/sysusers.d/byparr.conf"
}

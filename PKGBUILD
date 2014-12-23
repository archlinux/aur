# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Based on Teamcity PKGBUILD by Nowaker

pkgname=upsource
pkgver=1.0.12551
pkgrel=1
pkgdesc='Repository Browsing and Code Review tool from JetBrains'
arch=('any')
url="https://www.jetbrains.com/upsource/"
license=('Commercial')
depends=('java-runtime-headless')
install="$pkgname.install"
source=("https://download.jetbrains.com/upsource/upsource-${pkgver}.zip"
        'upsource.service'
	'upsource.conf')
sha512sums=('d8ecedf39f0379f1a4843a6404b61b57a96afa08429805bb0fc6c74c8f8d51be3255cc0e7686ec9a7e7ddd42e831e462649c1cb92851cff1fb7cecf30b3fbaef'
            '957ad2779ba9e5ac6385522963680df29566ddf3db078631a4116207c40ad83ead5e6cfe530bf4e4990cbc91a381326108732f0e69c8087e48a4a16aa671f3df'
	    '9bc5298409ef7159c0f928828019c09446f6ca2c8e8832bb6e54527457dc911ef388d48f355b9c36d288168feacd607b67ed8a9a0579a642080ba79024ae06c9')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  mkdir -p "${pkgdir}/usr/share/licenses"
  mkdir -p "${pkgdir}/var/lib/upsource"
  mkdir -p "${pkgdir}/opt/${pkgname}"

  install -Dm755 "${srcdir}/upsource.service" "${pkgdir}/usr/lib/systemd/system/upsource.service"
  install -Dm755 "${srcdir}/upsource.conf" "${pkgdir}/etc/conf.d/upsource"
  # Java for Windows or MacOS are not needed
  rm -rf "${srcdir}/Upsource/internal/java"
  cp -R "${srcdir}/Upsource"/* "${pkgdir}/opt/${pkgname}"
}

# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=rga
pkgver=0.9.1
pkgrel=1
pkgdesc="rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/phiresky/ripgrep-all"
license=(AGPL)
depends=(ripgrep ffmpeg pandoc poppler tesseract graphicsmagick)
makedepends=('rust' 'cargo')
conflicts=("${pkgname}-git")
source=("https://github.com/phiresky/ripgrep-all/archive/${pkgver}.tar.gz")
sha512sums=('59e65e8f8f6c2d9281dd143144aeb6e79b2db0d726efec26c46f8005968c9fa59fd5f44f4e6cc1bbd34c2c4296680fc71eed7c3cd2294f9eda76eaf8daea113f')

build() {
  cd "${srcdir}/ripgrep-all-${pkgver}"
  cargo build --release
}

check() {
  cd "${srcdir}/ripgrep-all-${pkgver}"
  cargo test --release
}

package() {
  cd "${srcdir}/ripgrep-all-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 "target/release/${pkgname}-preproc" "${pkgdir}/usr/bin/${pkgname}-preproc"
}


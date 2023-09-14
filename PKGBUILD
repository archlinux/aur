# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3.2
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('python-pip' 'python-pymupdf')

source=("https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('686cf765766043001b8097e84d872abb4483117191374cc653a246322a95d266')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"/TermPDFViewer-v."$pkgver"
}

build() {
  cd "$srcdir"/TermPDFViewer-v."${pkgver}"

  # Instala pyinstaller si aún no está instalado
  if ! command -v pyinstaller &>/dev/null; then
    pip install pyinstaller
  fi

  # Compila termpdf.py en un binario
  pyinstaller --onefile src/termpdf.py
}

package() {
  # Mueve el binario desde src/dist al directorio de destino
  install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/src/dist/termpdf "${pkgdir}/usr/bin/term-pdf"
}

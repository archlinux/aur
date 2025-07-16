# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gedit-plugin-markdown_preview
pkgver=3.0
pkgrel=1
pkgdesc="A gedit plugin previewing markdown (.md) documents"
arch=('any')
url="https://github.com/maoschanz/gedit-plugin-markdown_preview"
license=('GPL-3.0-or-later')
depends=(
  'gedit'
  'python-markdown'
  'webkit2gtk'
)
optdepends=(
  'pymdown-extensions: extra Python Markdown extensions'
  'python-pygments: for CodeHilite extension'
  'pandoc: export and stylesheet support'
  'texlive-bin: export to PDF with pandoc (pdflatex)'
  'texlive-fontsextra: export to PDF with pandoc (lmodern)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fcdb6e0624d6b2e92df2c65f357c17931ad65f8d883b8a668bb52fae95c70728')

build() {
  cd "$pkgname-$pkgver"
  sh translations.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 org.gnome.gedit.plugins.markdown_preview.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 markdown_preview.plugin -t "$pkgdir/usr/lib/gedit/plugins/"
  cp -r markdown_preview "$pkgdir/usr/lib/gedit/plugins/"
  install -Dm644 example.css -t "$pkgdir/usr/share/doc/$pkgname/"

  for lang in de fr nl pt_BR; do
    install -Dm644 "markdown_preview/locale/${lang}/LC_MESSAGES/gedit-plugin-markdown-preview.mo" -t \
      "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done

  rm -rf "$pkgdir/usr/lib/gedit/plugins/markdown_preview/locale"
}

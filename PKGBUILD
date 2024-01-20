# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gedit-plugin-markdown_preview
pkgver=2.0
pkgrel=3
pkgdesc="A gedit plugin previewing markdown (.md) documents"
arch=('any')
url="https://github.com/maoschanz/gedit-plugin-markdown_preview"
license=('GPL-3.0-or-later')
depends=('gedit' 'python-markdown' 'webkit2gtk')
optdepends=('pymdown-extensions: extra Python Markdown extensions'
            'python-pygments: for CodeHilite extension'
            'pandoc: export and stylesheet support'
            'texlive-bin: export to PDF with pandoc (pdflatex)'
            'texlive-fontsextra: export to PDF with pandoc (lmodern)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2fa757bb87d8b63fc206e307f6b963c9a2013d487f33fe7f564c9f0f2bc53a07')

build() {
  cd "$pkgname-$pkgver"
  sh translations.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 org.gnome.gedit.plugins.markdown_preview.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas"
  install -Dm644 markdown_preview.plugin -t "$pkgdir/usr/lib/gedit/plugins/"
  cp -r markdown_preview "$pkgdir/usr/lib/gedit/plugins"
  install -Dm644 example.css -t "$pkgdir/usr/share/doc/$pkgname/"

  for lang in fr nl; do
    install -Dm644 "markdown_preview/locale/${lang}/LC_MESSAGES/gedit-plugin-markdown-preview.mo" -t \
      "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done

  rm -rf "$pkgdir/usr/lib/gedit/plugins/markdown_preview/locale"
}

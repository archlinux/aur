# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gedit-plugin-markdown_preview-git
pkgver=r106.c259554
pkgrel=1
pkgdesc="A gedit plugin previewing markdown (.md) documents"
arch=('any')
url="https://github.com/maoschanz/gedit-plugin-markdown_preview"
license=('GPL3')
depends=('gedit' 'python-markdown' 'webkit2gtk')
makedepends=('git')
optdepends=('pymdown-extensions: extra Python Markdown extensions'
            'python-pygments: for CodeHilite extension'
            'pandoc: export and stylesheet support'
            'texlive-bin: export to PDF with pandoc'
            'texlive-core: export to PDF with pandoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/maoschanz/gedit-plugin-markdown_preview.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 org.gnome.gedit.plugins.markdown_preview.gschema.xml -t \
		"$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 markdown_preview.plugin -t "$pkgdir/usr/lib/gedit/plugins"
	cp -r markdown_preview "$pkgdir/usr/lib/gedit/plugins"
	install -Dm644 example.css -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}

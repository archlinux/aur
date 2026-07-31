# Maintainer: VolkinstridoFF <246958375+VolkinstridoV@users.noreply.github.com>
pkgname=mathmark
pkgver=1.0
pkgrel=1
pkgdesc="Reader for maths written in Markdown: formulas as in textbooks, marking changes one byte"
arch=('any')
url="https://github.com/VolkinstridoV/mathmark"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('git')
optdepends=('python-pytest: for running the test suite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b764f6288a204dcf7eaa13db984be0ff1a9c2292e4a944a74ddfbf5fede59393')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # сам код
    install -d "$pkgdir/usr/lib/mathmark"
    cp -r desktop/mathmark/. "$pkgdir/usr/lib/mathmark/"
    find "$pkgdir/usr/lib/mathmark" -name '__pycache__' -type d -exec rm -rf {} +

    # общее с версией для телефона: страница чтения, KaTeX, промпт, переводы
    install -d "$pkgdir/usr/share/mathmark"
    cp -r shared/reader shared/prompt shared/i18n "$pkgdir/usr/share/mathmark/"

    install -Dm755 desktop/mathmark-launcher "$pkgdir/usr/bin/mathmark"
    install -Dm644 desktop/dev.yury.mathmark.desktop \
        "$pkgdir/usr/share/applications/dev.yury.mathmark.desktop"
    install -Dm644 desktop/data/dev.yury.mathmark.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.yury.mathmark.svg"
    install -Dm644 desktop/data/dev.yury.mathmark.metainfo.xml \
        "$pkgdir/usr/share/metainfo/dev.yury.mathmark.metainfo.xml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

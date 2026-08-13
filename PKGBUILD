# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=incrementum-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A Spaced Repetition System built with Tauri"
arch=('x86_64')
url="https://github.com/melpomenex/incrementum-tauri"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'gcc-libs' 'glibc' 'zstd')
optdepends=(
    'notebooklm-py: NotebookLM integration for AI-powered flashcard generation'
    'python-notebooklm: Alternative NotebookLM package'
)
options=('!strip' '!lto' '!debug')
provides=('incrementum')
conflicts=('incrementum')

source=("https://github.com/melpomenex/incrementum-tauri/releases/download/v${pkgver}/incrementum-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('d79c415fdf42078a04f78d6f0770da2b9d74885ba60f49906c05a6ec23637302')

package() {
    bsdtar -xf "${srcdir}/incrementum-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO'

    # Create desktop entry (upstream does not ship one)
    install -d "${pkgdir}/usr/share/applications"
    printf '[Desktop Entry]\nName=Incrementum\nComment=A Spaced Repetition System built with Tauri\nExec=incrementum\nIcon=incrementum\nTerminal=false\nType=Application\nCategories=Education;Science;\n' > "${pkgdir}/usr/share/applications/incrementum.desktop"
}

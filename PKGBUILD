# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=incrementum-bin
pkgver=1.54.0
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

source=("https://github.com/melpomenex/incrementum-tauri/releases/download/v${pkgver}/incrementum-1.54.0-1-x86_64.pkg.tar.zst")
sha256sums=('5c768698adc143c1c12fa9956b34300c97ad2cec45a36203cd67c401d7a823a8')

package() {
    bsdtar -xf "${srcdir}/incrementum-1.54.0-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO'

    # Create desktop entry (upstream does not ship one)
    install -d "${pkgdir}/usr/share/applications"
    printf '[Desktop Entry]\nName=Incrementum\nComment=A Spaced Repetition System built with Tauri\nExec=incrementum\nIcon=incrementum\nTerminal=false\nType=Application\nCategories=Education;Science;\n' > "${pkgdir}/usr/share/applications/incrementum.desktop"
}

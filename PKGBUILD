# Maintainer: Berkan Cetinel <owlivion@users.noreply.github.com>
pkgname=davinci-resolve-audio-fix
pkgver=1.0.0
pkgrel=1
pkgdesc="Fix AAC audio in DaVinci Resolve on Linux — auto-watcher, Nautilus integration, DR script"
arch=('any')
url="https://github.com/owlivion-tech/davinci-resolve-audio-fix"
license=('MIT')
depends=('ffmpeg' 'inotify-tools')
optdepends=(
    'libnotify: desktop notifications'
    'python-tk: DaVinci Resolve GUI script'
    'nautilus: right-click integration'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/owlivion-tech/davinci-resolve-audio-fix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de6ff30f58ddf89569878314f2e22fb30a25f77e290c571471ead0e0453441b7')

package() {
    cd "${srcdir}/davinci-resolve-audio-fix-${pkgver}"

    # Executables
    install -Dm755 src/dr-convert.sh "${pkgdir}/usr/bin/dr-convert"
    install -Dm755 src/dr-watch.sh   "${pkgdir}/usr/bin/dr-watch"

    # Shared data
    install -Dm644 config/dr-watch.conf \
        "${pkgdir}/usr/share/${pkgname}/config/dr-watch.conf.example"

    install -Dm644 systemd/dr-audio-watch.service \
        "${pkgdir}/usr/share/${pkgname}/systemd/dr-audio-watch.service"

    install -Dm755 "nautilus/DR Audio Fix" \
        "${pkgdir}/usr/share/${pkgname}/nautilus/DR Audio Fix"

    install -Dm644 resolve_script/dr_audio_fix.py \
        "${pkgdir}/usr/share/${pkgname}/resolve_script/dr_audio_fix.py"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

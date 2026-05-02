# Maintainer: fkzys <fkzys at proton dot me>
_pkgname=subs2srs
pkgname=subs2srs-gui
pkgver=0.2.7
pkgrel=1
pkgdesc="Generate Anki flashcards from media with subtitles (GTK4 port)"
arch=('x86_64')
url="https://github.com/ajatt-tools/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime>=10' 'gtk4' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
makedepends=('dotnet-sdk>=10' 'git')
optdepends=('noto-fonts-cjk: CJK font support')
provides=('subs2srs' 'subs2srs-gui')
conflicts=('subs2srs' 'subs2srs-gui' 'subs2srs-mono-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f4d60858faf310d650f4e9fb50f79af51968146e8c010c3a431f1ce2b8dafa7')

build() {
    cd "${_pkgname}-${pkgver}"
    export DOTNET_CLI_HOME="$srcdir/.dotnet"
    export NUGET_SCRATCH="$srcdir/.nuget-scratch"
    export XDG_DATA_HOME="$srcdir/.local/share"
    export TMPDIR="$srcdir/.tmp"
    mkdir -p "$DOTNET_CLI_HOME" "$NUGET_SCRATCH" "$XDG_DATA_HOME" "$TMPDIR"
    make build
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}

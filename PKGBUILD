# Maintainer: fa5e4658010be730
_pkgname=subs2srs
pkgname=subs2srs-gui
pkgver=0.2.3
pkgrel=1
pkgdesc="Generate Anki flashcards from media with subtitles (GTK4 port)"
arch=('x86_64')
url="https://gitlab.com/fkzys/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime>=10' 'gtk4' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
makedepends=('dotnet-sdk>=10' 'git')
optdepends=('noto-fonts-cjk: CJK font support')
provides=('subs2srs')
conflicts=('subs2srs' 'subs2srs-mono-git')
_commit='ccd4f685c600efa240e9ba2f376b762ea30b3269'
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha256sums=('046f234fbd8008890eb49cfd6b67f20b52fe5e59db54cd75062eb500300db0f8')

build() {
    cd "${_pkgname}-v${pkgver}"
    export DOTNET_CLI_HOME="$srcdir/.dotnet"
    export NUGET_SCRATCH="$srcdir/.nuget-scratch"
    export XDG_DATA_HOME="$srcdir/.local/share"
    export TMPDIR="$srcdir/.tmp"
    mkdir -p "$DOTNET_CLI_HOME" "$NUGET_SCRATCH" "$XDG_DATA_HOME" "$TMPDIR"
    make build
}

package() {
    cd "${_pkgname}-v${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}

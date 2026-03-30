# Maintainer: fa5e4658010be730
_pkgname=subs2srs
pkgname=subs2srs-gui
pkgver=0.2.4
pkgrel=1
pkgdesc="Generate Anki flashcards from media with subtitles (GTK4 port)"
arch=('x86_64')
url="https://gitlab.com/fkzys/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime>=10' 'gtk4' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
makedepends=('dotnet-sdk>=10' 'git')
optdepends=('noto-fonts-cjk: CJK font support')
provides=('subs2srs' 'subs2srs-gui')
conflicts=('subs2srs' 'subs2srs-gui' 'subs2srs-mono-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('2c19a26a657acca4f4b88cb6f24cb3f53d3edc611994843ac77a9d5ea4242cb2')

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

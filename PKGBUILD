# Maintainer: fa5e4658010be730
_pkgname=subs2srs
pkgname=subs2srs-gui
pkgver=0.2.2
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('8bbef5785649dee749d3b6a678e4c7866f5319e273fe32df31bfd5355a701012')

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

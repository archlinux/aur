# Maintainer: fa5e4658010be730
pkgname=subs2srs-gui
pkgver=0.2.1
pkgrel=1
pkgdesc="Generate Anki flashcards from media with subtitles (GTK4 port)"
arch=('x86_64')
url="https://gitlab.com/fkzys/subs2srs"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime>=10' 'gtk4' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
makedepends=('dotnet-sdk>=10' 'git')
optdepends=('noto-fonts-cjk: CJK font support')
provides=('subs2srs')
conflicts=('subs2srs' 'subs2srs-mono-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('fa24a7f86231894bb52bc8a1569316fa87f16385efcb2e81ddf2d968aee2c223')

build() {
    cd "$pkgname"
    export DOTNET_CLI_HOME="$srcdir/.dotnet"
    export NUGET_SCRATCH="$srcdir/.nuget-scratch"
    export XDG_DATA_HOME="$srcdir/.local/share"
    export TMPDIR="$srcdir/.tmp"
    mkdir -p "$DOTNET_CLI_HOME" "$NUGET_SCRATCH" "$XDG_DATA_HOME" "$TMPDIR"
    make build
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}

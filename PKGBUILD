# Maintainer: fa5e4658010be730
pkgname=subs2srs-gtk3-git
pkgver=r57.956e836
pkgrel=1
pkgdesc="Generate Anki flashcards from media with subtitles (GTK3 port)"
arch=('x86_64')
url="https://gitlab.com/fkzys/subs2srs-gtk3"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime>=10' 'gtk3' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
makedepends=('dotnet-sdk>=10' 'git')
optdepends=('noto-fonts-cjk: CJK font support')
provides=('subs2srs-gtk3' 'subs2srs')
conflicts=('subs2srs-gtk3' 'subs2srs')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

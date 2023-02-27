# Maintainer: Deckweiss <Deckweiss75@gmail.com>

_name="arttime"
pkgname="${_name}-git"
pkgver=2.0.0.r454
pkgrel=8
pkgdesc="arttime is a clock, timer, time manager and text-art viewer for the terminal (https://github.com/poetaman/arttime/wiki)"
arch=('any')
url="https://github.com/poetaman/${_name}"
license=('GPLv3')
depends=(
    'zsh>=5.8'
)
optdepends=('libnotify: for desktop notifications'
            'diffutils: for systems where /etc/localtime is not a symlink and arttime needs to guess the timezone'
            'vorbis-tools: for sounds in case user has not installed pulseaudio or pipwire')
conflicts=(${_name})
provides=(${_name})
source=("git+https://github.com/poetaman/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git describe --tags $(git rev-list --tags --max-count=1)| grep -o '[0-9.]*'
).r$(git rev-list --count HEAD)"
}

package() {
    cd "$_name"
    #./install.sh --prefix "$pkgdir/usr/local/" --zcompdir "$pkgdir/usr/share/zsh/site-functions"
    #bindir="$installdir/bin"
    #artdir="$installdir/share/arttime/textart"
    #keypoemdir="$installdir/share/arttime/keypoems"
    #srcdir="$installdir/share/arttime/src"

    install -D -t "$pkgdir/usr/local/bin/" "./bin/artprint" "./bin/arttime"
    find "./share/arttime/keypoems/" -type f -exec install -D -t "$pkgdir/usr/local/share/arttime/keypoems/" {} \;
    find "./share/arttime/src/" -type f -exec install -D -t "$pkgdir/usr/local/share/arttime/src/" {} \;
    find "./share/arttime/textart/" -type f -exec install -D -t "$pkgdir/usr/local/share/arttime/textart/" {} \;

    install -D -t "$pkgdir/usr/share/zsh/site-functions/" "./share/zsh/functions/_artprint"
    install -D -t "$pkgdir/usr/share/zsh/site-functions/" "./share/zsh/functions/_arttime"
}

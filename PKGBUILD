# Maintainer: Deckweiss <Deckweiss75@gmail.com>

_name="arttime"
pkgname="${_name}-git"
pkgver=2.0.0.r454
pkgrel=10
pkgdesc="arttime is a clock, timer, time manager and text-art viewer for the terminal (https://github.com/poetaman/$_name/wiki)"
arch=('any')
url="https://github.com/poetaman/${_name}"
license=('GPLv3')
depends=(
    'zsh>=5.7'
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

    install -D -t "$pkgdir/usr/bin/" "./bin/artprint" "./bin/$_name"
    find "./share/$_name/keypoems/" -type f -exec install -D -t "$pkgdir/usr/share/$_name/keypoems/" {} \;
    find "./share/$_name/src/" -type f -exec install -D -t "$pkgdir/usr/share/$_name/src/" {} \;
    find "./share/$_name/textart/" -type f -exec install -D -t "$pkgdir/usr/share/$_name/textart/" {} \;

    install -D -t "$pkgdir/usr/share/zsh/site-functions/" "./share/zsh/functions/_artprint"
    install -D -t "$pkgdir/usr/share/zsh/site-functions/" "./share/zsh/functions/_arttime"

    install -Dm644 LICENSE_CODE "$pkgdir/usr/share/licenses/$_name/LICENSE_CODE"
    install -Dm644 LICENSE_ART "$pkgdir/usr/share/licenses/$_name/LICENSE_ART"
    install -Dm644 LICENSE_ADDENDUM_CFLA "$pkgdir/usr/share/licenses/$_name/LICENSE_ADDENDUM_CFLA"
}

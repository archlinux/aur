# Maintainer: Ethan McTague <ethan@tague.me>
pkgname=python-wal-steam-git
_gitname=wal_steam
pkgver=1.0.2.r0.g7250820
pkgrel=1
pkgdesc='Generate and change steam colorscheme on the fly'
arch=('any')
url='https://github.com/kotajacob/wal_steam'
license=('MIT')
depends=('python-pywal' 'steam')
source=('git+https://github.com/kotajacob/wal_steam.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  # Copy over the source to a directory.
  mkdir -p "${pkgdir}/opt"
  cp -r "$srcdir/${_gitname}" "${pkgdir}/opt/wal_steam" 

  # Make a script to run it, in the PATH.
  mkdir -p "${pkgdir}/usr/bin"
  echo -e "#!/bin/sh\npython /opt/wal_steam/wal_steam.py \$@" > "${pkgdir}/usr/bin/wal_steam"
  chmod +x "${pkgdir}/usr/bin/wal_steam"

  # Install License
  install -Dm644 "$srcdir/${_gitname}/LICENSE" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

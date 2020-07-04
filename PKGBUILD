# Contributor: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=steamtinkerlaunch
pkgver=c1f6d094b7c5456211bed42dfa5ac62253670e84
#_commit=e433c599e40bc47c7b0e4d16934815c84b26eea8
pkgrel=1
pkgdesc='SteamTinkerLaunch or short stl - is a linux wrapper script for steam. It creates/reads game config files on the fly, making it very easy to setup and use, but still giving you the possibility to fully customize game configurations live on game start.'
arch=('any')
url="https://github.com/frostworx/steamtinkerlaunch"
license=('GPL3')
depends=('bash')
backup=('etc/sshuttle/tunnel.conf' 'etc/sshuttle/prefixes.conf')
source=("git+https://github.com/frostworx/steamtinkerlaunch.git")
sha1sums=('SKIP')

pkgver() {
        cd "$pkgname"
        cat .git/refs/heads/master
}

package() {
  cd "$srcdir/$pkgname"

  # Make directories to install into
  install -d "$pkgdir/usr/local/share/stl"
  install -d "$pkgdir/usr/local/bin"

  # Install package files
  install -m755 "stl" "$pkgdir/usr/local/bin/stl"

  find . -maxdepth 1 -type d -not -name '.git' -and -not -name '.' -print0 | xargs -i'{}' -0 cp -R {} "$pkgdir/usr/local/share/stl"
}

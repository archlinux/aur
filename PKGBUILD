# $Id$
# Maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au> aka flaccid

pkgname=rightlink-bin
pkgver=10.5.2
pkgrel=1
pkgdesc="RightLink RL10 is a new version of RightScale's server agent that connects servers managed through RightScale to the RightScale cloud management platform."
license=('RightScale')
arch=('x86_64')
url="http://docs.rightscale.com/release-notes/right-link-10.html"
license=(RightScale)
conflicts=(rightscale)
replaces=(rightscale)
depends=('cloud-init')
provides=('rightlink')
source=("https://rightlink.rightscale.com/rll/$pkgver/rightlink.tgz")
md5sums=('cb1ad7eb6b17ed99424c65183ac63b8f')
install='rightlink.install'
options=(emptydirs strip !docs !libtool !staticlibs)

package() {
  install -D -m755 "$srcdir/rightlink/rightlink" "$pkgdir/usr/bin/rightlink"
  install -D -m755 "$srcdir/rightlink/rightlink" "$pkgdir/usr/bin/rsc"
  install -D -m644 "$srcdir/rightlink/rightlink.service" "$pkgdir/usr/lib/systemd/system/rightlink.service"
  install -D -m440 "$startdir/90-rightscale" "$pkgdir/etc/sudoers.d/90-rightscale"

  # add a symlink for the binary in /usr/local/bin to support
  # the systemd service included in the source
  install -d "$pkgdir/usr/local/bin"
  cd "$pkgdir/usr/local/bin"
  ln -sf /usr/bin/rightlink ./rightlink

  # ensure these folders match standard permissions on filesystem
  chmod 750 "$pkgdir/etc/sudoers.d"
}

# vim:set ts=2 sw=2 et:

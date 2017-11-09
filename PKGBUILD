# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=1.0.35_20171109173309+a4a2652b2
deb_pkgver="${pkgver/_/-}"
deb_pkgver="${deb_pkgver/+/.}"
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse gconf libxss gtk2) # don't change this without changing the SRCINFO template too
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-git)
source_i686=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_${deb_pkgver}_i386.deb"
)
source_x86_64=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_${deb_pkgver}_amd64.deb"
)
install=keybase.install

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  deb_package="keybase_${deb_pkgver}_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Omit the cronjobs that the Debian package includes.
  rm -rf "$pkgdir/etc/cron.daily"
}

sha256sums_i686=(84d45818c4003430650fa07f99ec0cf513f2a5e764107c78a6f18f9fd054adc6)
sha256sums_x86_64=(ccab014761122196e4df3669ca7e3ce8acb846204063be9d9a9245b79fb756a7)

# Maintainer: Keybase <linux-packages@keyba.se>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=6.2.4_20240101011938+ae7e4a1c15
src_prefix=https://prerelease.keybase.io/linux_binaries/deb
deb_pkgver="${pkgver/_/-}"
deb_pkgver="${deb_pkgver/+/.}"
pkgrel=1
arch=('x86_64')
depends=(fuse libxss gtk3 lsof) # don't change this without changing the SRCINFO template too
                                # also make sure to change the keybase-git PKGBUILD
provides=(keybase keybase-gui kbfs)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-git keybase-gui kbfs)
source_x86_64=(
  "${src_prefix}/keybase_${deb_pkgver}_amd64.deb"
)
install=keybase.install

package() {
  if [ "$CARCH" = "x86_64" ] ; then
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

# You can cross reference these hashes with Keybase Debian repo metadata:
# https://prerelease.keybase.io/deb/dists/stable/main/binary-amd64/Packages
sha256sums_x86_64=(5f219bf45f37cfcf8e4a3c4e68ee64fa1daa218efca1f4bf65f4d7922e781394)

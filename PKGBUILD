# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=nitrile-bin
pkgver=0.4.24
pkgrel=1
pkgdesc="A package manager and build tool for Clean programming language"
arch=(x86_64)
url="https://clean-and-itasks.gitlab.io/nitrile"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs')
options=(!strip)
# source=("nitrile-${pkgver}-linux-x64.tar.gz::https://gitlab.com/clean-and-itasks/nitrile/-/package_files/131055318/download")
source=("nitrile.tgz::$( curl -s https://clean-lang.org/api/packages/nitrile | jq -r .versions[.latest_version].targets.\"linux-x64\".url )")
sha256sums=('cbe2e29d846cc83343715a8515eea3328faac465974df2fd75b8cfc2455f0595')

pkgver() {
  echo nitrile-*-linux-x64 | sed 's/nitrile-//; s/-linux-x64//'
}

package() {
  cd "nitrile-${pkgver}-linux-x64"

  install -Dm755 bin/nitrile ${pkgdir}/opt/nitrile/bin/nitrile
  install -Dm644 bin/libz3.nitrile.so ${pkgdir}/opt/nitrile/bin/libz3.nitrile.so

  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/nitrile/bin/nitrile $pkgdir/usr/bin/nitrile
}



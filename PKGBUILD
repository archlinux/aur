pkgname=(
  # base package is multi-account-containers-lite.
  multi-account-containers-lite
  # others contain only symlinks for activation in corresponding browser
  firedragon-multi-account-containers-lite
  firefox-multi-account-containers-lite
  floorp-multi-account-containers-lite
  icecat-multi-account-containers-lite
  librewolf-multi-account-containers-lite
  midori-multi-account-containers-lite
)

pkgver=8.3.7003
pkgrel=1
pkgdesc="Debranded Multi-Account-Containers fork from Konform Browser for separate installation"
arch=('any')
license=('MPL-2.0')
groups=('firefox-addons')
makedepends=('git' 'node-gyp' 'npm' 'pnpm' 'strip-nondeterminism' 'zip')
url=https://codeberg.org/Konsortium/multi-account-containers-lite
_commit=4d39314cbfdd37c93bcee8f1ee60565d40b5c9d1
source=("mac::git+${url}#commit=$_commit")
sha512sums=('96b7a71325990f37e16d753cb0fba1d8c53493e342477b168c2120dc0a4b40e5e8e1791f0b0ecfc3494268cb401ef8e7edff759a54d1fcbb3a0f378056128698')

prepare() {
  cd "mac"
  git submodule update --init --recursive
  pnpm i
}

build() {
  cd "mac"
  pnpm build
}

package_multi-account-containers-lite() {
  cd "mac/src/web-ext-artifacts"
  /usr/bin/vendor_perl/strip-nondeterminism -t zip *.zip
  install -d "$pkgdir"/usr/lib/mozilla/browser/extensions
  install -Dvm644 firefox_multi-account_containers-${pkgver}.zip "$pkgdir/usr/lib/mozilla/browser/extensions/multi-account_containers.xpi"
}

package_firedragon-multi-account-containers-lite() {
  export groups=('firedragon-addons')
  export depends=('multi-account-containers-lite')
  mkdir -p "$pkgdir/usr/lib/firedragon/browser/extensions/"
  ln -s /usr/lib/mozilla/browser/extensions/multi-account_containers.xpi "$pkgdir/usr/lib/firedragon/browser/extensions/multi-account_containers.xpi"
}

package_firefox-multi-account-containers-lite() {
  export groups=('firefox-addons')
  export depends=('multi-account-containers-lite')
  mkdir -p "$pkgdir/usr/lib/firefox/browser/extensions/"
  ln -s /usr/lib/mozilla/browser/extensions/multi-account_containers.xpi "$pkgdir/usr/lib/firefox/browser/extensions/multi-account_containers.xpi"
}

package_floorp-multi-account-containers-lite() {
  export groups=('floorp-addons')
  export depends=('multi-account-containers-lite')
  mkdir -p "$pkgdir/usr/lib/floorp/browser/extensions/"
  ln -s /usr/lib/mozilla/browser/extensions/multi-account_containers.xpi "$pkgdir/usr/lib/floorp/browser/extensions/multi-account_containers.xpi"
}

package_icecat-multi-account-containers-lite() {
  export groups=('icecat-addons')
  export depends=('multi-account-containers-lite')
  mkdir -p "$pkgdir/usr/lib/icecat/browser/extensions/"
  ln -s /usr/lib/mozilla/browser/extensions/multi-account_containers.xpi "$pkgdir/usr/lib/icecat/browser/extensions/multi-account_containers.xpi"
}

package_librewolf-multi-account-containers-lite() {
  export groups=('librewolf-addons')
  export depends=('multi-account-containers-lite')
  mkdir -p "$pkgdir/usr/lib/librewolf/browser/extensions/"
  ln -s /usr/lib/mozilla/browser/extensions/multi-account_containers.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/multi-account_containers.xpi"
}

package_midori-multi-account-containers-lite() {
  export groups=('midori-addons')
  export depends=('multi-account-containers-lite')
  mkdir -p "$pkgdir/usr/lib/midori/browser/extensions/"
  ln -s /usr/lib/mozilla/browser/extensions/multi-account_containers.xpi "$pkgdir/usr/lib/midori/browser/extensions/multi-account_containers.xpi"
}

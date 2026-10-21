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

pkgver=8.3.8000
pkgrel=1
pkgdesc="Debranded Multi-Account-Containers fork from Konform Browser for separate installation"
arch=('any')
license=('MPL-2.0')
groups=('firefox-addons')
makedepends=('git' 'node-gyp' 'npm' 'pnpm' 'strip-nondeterminism' 'zip')
url=https://codeberg.org/Konsortium/multi-account-containers-lite
_commit=b6c9007467b8e60c255e767bd1f7acc0850676f8
source=(
  "mac::git+${url}#commit=$_commit"
  "0001-test-nyc-18.patch"
  "0002-test-priming.patch"
)
sha512sums=('bc9bb6fab04db1a9e2bb2b63eede314e29190d74fb56fa1a5840bbbba7272e75e4f5e4cc19c0dca4335f0b2f5b4c26d939288331b596b433002011e9940851cc'
            '35690941f17e3960571e748e0752a8413d7117e7488c9f982c97b3a1f843f747a4eda7a865e46e2b1f5c3209ae6f4cc7beb0525987c529077bda388ceda4ffe3'
            '0de8914b79d0de4467dc6e139dd2be43296db2fc87e27140813d8af30d6126bc9567e6867a07f68fef1d421b435dd8c8b1c04fa126f6ff9e16a642b2b561eac3')

prepare() {
  cd "mac"
  git submodule update --init --recursive
  patch -p1 < ../0001-test-nyc-18.patch
  patch -p1 < ../0002-test-priming.patch
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
  install -Dvm644 multi-account_containers-${pkgver}.zip "$pkgdir/usr/lib/mozilla/browser/extensions/multi-account_containers.xpi"
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

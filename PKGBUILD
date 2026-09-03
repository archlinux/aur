# Maintainer: Markus Maiwald <markus@maiwald.tk>
pkgname=prism-harness-suite-bin
_ver=1.0.0-rc.3
pkgver="${_ver//-/_}"
pkgrel=1
pkgdesc="PRISM harness suite for AI coding agents: doctrine, memory, reviews, model routing, compression, chat — prebuilt standalone binaries, no bun runtime needed"
arch=('x86_64')
url="https://getharness.app"
license=('custom:LSL-1.0')
provides=('prism-harness' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober' 'prism-chat' 'prism-harness-suite')
conflicts=('prism-harness' 'prism-loop' 'prism-proxy' 'prism-route' 'prism-sober' 'prism-chat' 'prism-harness-suite')
options=('!strip')
_b="https://git.sovereign-society.org/api/packages/prism/generic/prism-harness-suite/$_ver"
source=("$_b/prism-harness-$_ver-linux-amd64.xz"
        "$_b/prism-loop-$_ver-linux-amd64.xz"
        "$_b/prism-sober-$_ver-linux-amd64.xz"
        "$_b/prism-route-$_ver-linux-amd64.xz"
        "$_b/prism-proxy-$_ver-linux-amd64.xz"
        "$_b/prism-chat-$_ver-linux-amd64.xz")
sha256sums=('a995225d5d035e2b55f8272007a03d8b0566c9356502b1dc8442abd271ba95fb'
            '8e901ec470ec9fb2b1d8864f749ced71c96ab83072e7c88be119ee4e71a9a53f'
            'b98492358df6dee94e296bf33e0427e2305a374d53e9786e8d7c4935af82fe59'
            '58689820014b2c48e104812066be26457ac8f0a140dfdc93aad910c9d9508af1'
            'e41ed58e4cd76e69c80c58fea8dd31bf48c54232d76009758a0f1840f93adb89'
            '2944f753b739e61b47d4750f4ab39d74f813436f461593b49fe1d3f1793ad564')

# Single-file xz "archives": makepkg decompacts each to $srcdir keeping the
# full source name, without the exec bit — restore it before install.
_binaries=("prism-harness-$_ver-linux-amd64" "prism-loop-$_ver-linux-amd64"
           "prism-sober-$_ver-linux-amd64" "prism-route-$_ver-linux-amd64"
           "prism-proxy-$_ver-linux-amd64" "prism-chat-$_ver-linux-amd64")

prepare() {
  cd "$srcdir"
  chmod +x "${_binaries[@]}"
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  # install each under its real CLI name
  install -m755 "${_binaries[0]}" "$pkgdir/usr/bin/prism-harness"
  install -m755 "${_binaries[1]}" "$pkgdir/usr/bin/prism-loop"
  install -m755 "${_binaries[2]}" "$pkgdir/usr/bin/prism-sober"
  install -m755 "${_binaries[3]}" "$pkgdir/usr/bin/prism-route"
  install -m755 "${_binaries[4]}" "$pkgdir/usr/bin/prism-proxy"
  install -m755 "${_binaries[5]}" "$pkgdir/usr/bin/prism-chat"
}

# Maintainer: jjunho
# SPDX-License-Identifier: 0BSD
pkgname=visual-studio-code-autoupdate
pkgver=0.0
pkgrel=3
pkgdesc='Direct Microsoft VS Code updater with a twice-daily user timer'
arch=('x86_64')
url='https://code.visualstudio.com/'
license=('0BSD')
depends=('python>=3.12' 'systemd' 'ca-certificates' 'bash' 'coreutils' 'util-linux'
         'libxkbfile' 'gnupg' 'gtk3' 'libsecret' 'nss' 'gcc-libs'
         'libnotify' 'libxss' 'glibc' 'lsof' 'shared-mime-info' 'xdg-utils' 'alsa-lib')
optdepends=('glib2: move files to trash'
            'libdbusmenu-glib: KDE global menu'
            'org.freedesktop.secrets: settings sync'
            'bubblewrap: agent host sandboxing'
            'socat: agent host sandboxing')
provides=('code' 'vscode')
conflicts=('code' 'visual-studio-code-bin')
install=visual-studio-code-autoupdate.install
source=('vscode-update'
        'code'
        'vscode-update.service'
        'vscode-update.timer'
        'com.microsoft.VSCode.desktop'
        'com.microsoft.VSCode.UrlHandler.desktop'
        'code-workspace.xml'
        'visual-studio-code-autoupdate.install'
        'README.md'
        'LICENSE'
        'test_vscode_update.py')
sha256sums=('aa9f34269d31e79986f2926d2d10b0f11bc1e798b5bc06c9c8eea78a81ae53ae'
            '5a7e39e4ac75500228403d663574f4a63a968b2af8c7a43038fd85921215c144'
            '98b0f14f6e4450b60d93f40856c2cd594778027c67b6cd3f478256df603effeb'
            'b78b77f72580b2fa0a10e693267c5b0400ce935e3fbb99f8aeb2424d9cc42ec6'
            'ec91701af331a1631c45d79b7eebe4706fab2119d838845de48c431da1b29da7'
            '6e1be6dc797966af296216fd08cf16d521786cef059c2f8d0198d3197009c158'
            'a06f8d3e435e40fe1ae4ac3782edb782ffb51993d73b612ed9cd2054d1a0e57f'
            'b0b21cf9b72d6017cff9b2b246fc13eef26dbd5aea984ef2fdac37e866fe0575'
            '956719da28beae08d451591051bef26127335296c1a47c4c45931394a0e80a45'
            '6668196519d52d349278e9b272ec3751aeb50d29a688a0eec45b3caae11b7159'
            'c1ef08c7abce1cb7c12594e08ea3697c539f71c3799113de8f065b07d9309179')

check() {
  python -B test_vscode_update.py
}

package() {
  install -Dm755 vscode-update "$pkgdir/usr/bin/vscode-update"
  install -Dm755 code "$pkgdir/usr/bin/code"
  install -Dm644 vscode-update.service "$pkgdir/usr/lib/systemd/user/vscode-update.service"
  install -Dm644 vscode-update.timer "$pkgdir/usr/lib/systemd/user/vscode-update.timer"
  install -Dm644 com.microsoft.VSCode.desktop \
    "$pkgdir/usr/share/applications/com.microsoft.VSCode.desktop"
  install -Dm644 com.microsoft.VSCode.UrlHandler.desktop \
    "$pkgdir/usr/share/applications/com.microsoft.VSCode.UrlHandler.desktop"
  install -Dm644 code-workspace.xml "$pkgdir/usr/share/mime/packages/code-workspace.xml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

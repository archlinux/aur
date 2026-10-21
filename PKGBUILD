# Maintainer: Juliano Paiva Junho <jjunho at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=visual-studio-code-autoupdate
pkgver=1.0
pkgrel=2
pkgdesc='Direct Microsoft VS Code updater with a twice-daily user timer'
arch=('x86_64')
url='https://github.com/jjunho/visual-studio-code-autoupdate'
license=('0BSD')
depends=('python>=3.12' 'systemd' 'ca-certificates' 'bash' 'coreutils' 'util-linux' 'polkit'
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
        'test_vscode_update.py'
        'test_code_setup.py'
        'create-directory')
sha256sums=('ed0f4ad06e7a67892b73a4e326e4d857347983d17aa83365a9c61d69976bc76f'
            '241a462e6f212e4a8a1485d04ec160db8606db500927cce7ae432bf4c59350f6'
            '98b0f14f6e4450b60d93f40856c2cd594778027c67b6cd3f478256df603effeb'
            'b78b77f72580b2fa0a10e693267c5b0400ce935e3fbb99f8aeb2424d9cc42ec6'
            'ec91701af331a1631c45d79b7eebe4706fab2119d838845de48c431da1b29da7'
            '6e1be6dc797966af296216fd08cf16d521786cef059c2f8d0198d3197009c158'
            'a06f8d3e435e40fe1ae4ac3782edb782ffb51993d73b612ed9cd2054d1a0e57f'
            '5121967943ebabe4ce7f783593b44633fc86f936c802206e85c4a60c2cc99cae'
            '4b4dd724a8a78993a36fb79f617db4adaa46615b4ab3e57095f588b2e01cf757'
            '6668196519d52d349278e9b272ec3751aeb50d29a688a0eec45b3caae11b7159'
            '77828472203a1a24c840547d22986e97caa6ace7f57491efe696f9773150aa77'
            'cf8fb4657850204bbe349e7d87f69e77fb49fd4361250edae7a7d634b5ab1587'
            '3c01a6da00a4445a0f3260b78114f841c4a2d9a719261b0b9bad88b6d7668ac9')

check() {
  python -B -m unittest discover -p 'test_*.py'
}

package() {
  install -Dm755 vscode-update "$pkgdir/usr/bin/vscode-update"
  install -Dm755 code "$pkgdir/usr/bin/code"
  install -Dm755 create-directory "$pkgdir/usr/lib/$pkgname/create-directory"
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

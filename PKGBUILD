# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-powershellget-v3
# PowerShellGet v3 is a compatibility module that maps the PowerShellGet 2.x cmdlets (Install-Module,
# Find-Module, ...) onto PSResourceGet. Installed, it shadows the PowerShellGet v2 that powershell bundles,
# as /usr/share/powershell/Modules is searched before $PSHOME/Modules, so Install-Module and friends run on
# PSResourceGet. Remove the package to go back to the bundled v2. It's two script files, no build needed.
_modulever=3.0.23
# There are no releases or tags, so this is the last commit of the master branch, 3.0.23-beta23. If a
# stable 3.0.23 is ever released, it sorts older than this (verchecks), so bump with an epoch then.
pkgver=3.0.23beta23
pkgrel=1
_commit=a2dac8e74603f7c9eec4a54c5e23459531751b0d
pkgdesc="PowerShellGet v3, the compatibility module mapping PowerShellGet 2.x cmdlets onto PSResourceGet"
arch=(any)
url='https://github.com/PowerShell/PowerShellGet'
license=(MIT)
# PSResourceGet, which it builds on, is part of powershell
depends=(powershell)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('d1e93ac69b31ea1094a0145f5117995b70b671ab791e67b17b2797272cec30bd111ef0383ece0547886ef21914526f6437d6caed39b4425404dd020abd979ce7')
b2sums=('4a218634e6a08384826f51246cdd4f71be9642069281a14719602a7b0b5ce9f1c32550f47315a4b78607ee2e6d80c176ea3eda367640ba8dcf6258b7c158a14c')

package() {
  cd "PowerShellGet-$_commit" || exit
  install -Dm644 -t "$pkgdir/usr/share/powershell/Modules/PowerShellGet/$_modulever" \
    src/PowerShellGet.psd1 src/PowerShellGet.psm1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

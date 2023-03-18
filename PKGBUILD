pkgname=libelectron
pkgver=1.0.9
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=('npm' 'git')
pkgdesc="A collection of npm dependencies for electron packages."
_MachineType=`uname -m`
_electron=23.1.4
_electroncastlabs=v23.1.3+wvcus
_ecm=3.6.1
_electron_ce=3.10.0
_fs_extra=11.1.0

package() {
    if [[ ${_MachineType} == aarch64 ]]; then
      npm i electron@$_electron electron-context-menu@$_ecm electron-chrome-extensions@$_electron_ce fs-extra@$_fs_extra
      #Ignoring Electron Castlab until it is avaliable
fi
if [[ ${_MachineType} == x86_64 ]]; then
      npm i electron@$_electron electron-context-menu@$_ecm electron-chrome-extensions@$_electron_ce fs-extra@$_fs_extra
      npm install "https://github.com/castlabs/electron-releases#$_electroncastlabs" --save-dev
fi
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r ./node_modules "$pkgdir/opt/libelectron"
}

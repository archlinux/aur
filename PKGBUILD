# Maintainer: chaewon <64337177+authorisation@users.noreply.github.com>

pkgname=pyzule-git
pkgver=r279.3aa5608
pkgrel=1
pkgdesc="An azule "clone" written in python3"
arch=(x86_64)
url="https://github.com/asdfzxcvbn/pyzule"
license=('Unlicense')
provides=('pyzule' 'otool' 'install_name_tool' 'ldid')
depends=('python3' 'unzip' 'python-lief' 'python-pillow' 'python-orjson' 'curl' 'ipsw-bin')
makedepends=('git')
conflicts=('ldid' 'ldid2' 'ldid-git') # Remove later if ldid on the AUR works
source=('git+https://github.com/asdfzxcvbn/pyzule'
#        'https://github.com/asdfzxcvbn/pyzule/raw/main/deps/install_name_tool_x86_64' 
#        'https://github.com/asdfzxcvbn/pyzule/raw/main/deps/ldid_Linux_x86_64' #Have this here because ldid on the AUR fails to build
#        'https://github.com/asdfzxcvbn/pyzule/raw/main/deps/otool_x86_64'
#        'https://raw.githubusercontent.com/asdfzxcvbn/pyzule/main/zxcvbn_dir.zip'
       )
noextract=('zxcvbn_dir.zip')
md5sums=('SKIP'
#         '05fe799326f3459d05d182209abd6a78'
#         'cc44eb427fcbac4b466cd3c97f7a6d1d'
#         '04dd1643a715b2c86f7f328d2bc3d73c'
#         'a7975d056195267cb31a47aea6f48527'
        )

function pkgver() {
  cd pyzule

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/home/${USER}/.config/pyzule"

  #Dependencies, I know this is not ideal, but I don't know any other way to do this without torturing myself
  install -D -m755 "${srcdir}/pyzule/deps/install_name_tool_x86_64" "${pkgdir}/usr/local/bin/install_name_tool"
  install -D -m755 "${srcdir}/pyzule/deps/otool_x86_64" "${pkgdir}/usr/local/bin/otool"
  install -D -m755 "${srcdir}/pyzule/deps/ldid_Linux_x86_64" "${pkgdir}/usr/local/bin/ldid" #Remove later if ldid on the AUR works

  unzip -o "${srcdir}/pyzule/zxcvbn_dir.zip" -d "${pkgdir}/home/${USER}/.config/pyzule"
  cp "${srcdir}/pyzule/version.json" "${pkgdir}/home/${USER}/.config/pyzule"

  install -D -m755 "${srcdir}/pyzule/pyzule.py" "${pkgdir}/usr/local/bin/pyzule"
}

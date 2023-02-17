# Maintainer: Oran RH <oranroha@gmail.com>

pkgname="digital-logic-sim-git"
license=('CC BY-NC-SA 4.0')
pkgver=1.0.2
pkgrel=1.1
pkgdesc="Simple digital logic simulator made by Sebastian Lague for his series on digital logic"
arch=('x86_64')
makedepends=("unzip"
  "unityhub")
url=https://github.com/SebLague/Digital-Logic-Sim
source=("https://github.com/SebLague/Digital-Logic-Sim/archive/refs/heads/main.zip"
  "https://raw.githubusercontent.com/Oman395/digital-logic-sim-aur/master/digital_logic_sim.desktop"
  "https://raw.githubusercontent.com/Oman395/digital-logic-sim-aur/master/digital-logic-sim.png")
sha256sums=('09c35316ea16a36100e97f0db02fa15dea4f06d4139a5fa59d298fb1e4f011b7'
            'dd510a341964ef57e74bf28b7427d1da934a7a5295cf15531790709be3cc117e'
            '0c7203b6978d98b1885c62c995210059ad58d66c530f7d0c6a6da38e52a775d0')




prepare() {
  unzip $srcdir/main.zip
}

build() {
  echo "Installing unity 2022.2.6 through unityhub"
  unityhub --headless install -v 2022.2.6 -quit
  echo "Adding linux build support to unity 2022.2.6"
  unityhub --headless install-modules -v 2022.2.6 -m linux-il2cpp -quit
  echo "Building!"
  "$HOME/Unity/Hub/Editor/2022.2.6f1/Editor/Unity" -batchmode -buildLinux64Player build/out.x86_64 -buildTarget Linux64 -projectPath "$srcdir/Digital-Logic-Sim-main" -quit
}

package() {
  mkdir -p "$pkgdir/opt/digital-logic-sim"
  cp -r "${srcdir}/Digital-Logic-Sim-main/build"/* "$pkgdir/opt/digital-logic-sim"
  chmod +x "$pkgdir/opt/digital-logic-sim/out.x86_64"
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/digital_logic_sim.desktop" "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/"
  cp "$srcdir/digital-logic-sim.png" "$pkgdir/usr/share/icons/digital-logic-sim.png"
}

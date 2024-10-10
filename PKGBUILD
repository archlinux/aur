_pkgname="figma-linux"
pkgname="${_pkgname}-bin"
pkgver="0.11.5"
pkgrel="0"
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
url="https://github.com/Figma-Linux/figma-linux"
arch=("x86_64" "aarch64")
license=("GPL2")
depends=("hicolor-icon-theme")
makedepends=("unzip" "xdg-utils")
options=("!strip")
provides=("${_pkgname}")
source=("128x128.png"
        "192x192.png"
        "24x24.png"
        "256x256.png"
        "36x36.png"
        "384x384.png"
        "48x48.png"
        "512x512.png"
        "64x64.png"
        "72x72.png"
        "96x96.png"
        "figma-linux.desktop"
        "scalable.svg")
sha256sums=("86f34a8d9ddfdcfad5cc5e170a729cee7bca61102fbe0b10746b7f83b19d45bc"
            "f31ecf744bcf883a10656568aa3e3d5e9efa5c705d54803a3e58fe768d30006a"
            "c94eaaf01a82688ab7951ea1d1085f50c3ebed588993d68c173139db848b21c6"
            "1db635df7d84f73694303eba423acd75da892e084cf35c4e260bd5c6b56fcc1e"
            "40b456b40c557395b1d9cedd035c7d14a169f8207d60441177e1f3c0582768da"
            "5dc381da3bb02e5bc9d60cdbae3e3c5c8f249a83b4ef606721bb87559d0a122b"
            "72d0c9df5b81a7666a05751a38fe096f629096be73792355f6069024cf7c0412"
            "e77bf9e7c699a53e69ba4a025e31ccf2b0a3b4c86acc842f7d0ecf1f8fe71ac2"
            "780219a3792c5c4160829e7a8023e16f78e12c807762d7217a9db90e43a3f777"
            "c00c6751c90b394fc7bca51e5c6f139f16843d5f9f425b4ba31627dbaffaf0f9"
            "8d8f214d2e1f8e3816bbcf1262b273bedd56f1504326a2d54b2a1ba6cede63de"
            "dd02374b347f627d5d0a2201d366e5fd76eb1958759d311b3d72826a4a22fd47"
            "73edf53d70de1cfe0d4361c44efe9f55930649a55b40180c7cc5fa4ec70f39a5")
conflicts=("figma-linux" "figma-linux-git")
source_x86_64=("https://github.com/Figma-Linux/figma-linux/releases/download/v0.11.5/figma-linux_0.11.5_linux_amd64.zip")
sha256sums_x86_64=("e667df1d31cc9ff12f31d092289394a29296818a212dfe3fad0e98af7a0aadcd")
source_aarch64=("https://github.com/Figma-Linux/figma-linux/releases/download/v0.11.5/figma-linux_0.11.5_linux_arm64.zip")
sha256sums_aarch64=("68d10dd46c6c1431cda0f6fa226b18b66636387885846031c25eaf3a224d0899")


package() {
  cd "${srcdir}"

  install -D "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -D "${srcdir}"/256x256.png "${pkgdir}"/usr/share/pixmaps/${_pkgname}.png

  for size in 24 36 48 64 72 96 128 192 256 384 512; do
    install -D "${srcdir}/${size}x${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done

  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -rf ./* "${pkgdir}/opt/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  xdg-mime default ${_pkgname}.desktop x-scheme-handler/figma
}
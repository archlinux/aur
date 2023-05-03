# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="quick-tester"
_pkgname="quicktester"
pkgname=${_pkgbase}-git
pkgver=1.0
pkgrel=1
url="https://github.com/badcast/QuickTester"
pkgdesc="A program for self-testing and assessment of knowledge."
arch=(x86_64 i686)
license=('GPL3')
depends=('mono' 'dotnet-runtime' 'sh' 'hicolor-icon-theme')
makedepends=('dotnet-sdk')
source=("git+${url}.git"
       "${_pkgname}"
       "${_pkgname}.desktop"
       "${_pkgname}.png")
sha256sums=('SKIP'
            '01a7db83ea7937d98f7885ab689d8bc7b1f93fa2c0cee2d126bee97af87b20f8'
            '71d41bd6f9e1eb5581e0168abb2046f1dabb1ccd4c1a3dfb463e918f0026ae79'
            '1b3f9be2e3d43219dabeb9d1e49c25ee621ac43e3f6790df8b53bb640f3f8d6e')

build(){
   cd "${srcdir}/QuickTester/QuickTestProject"

   xbuild /nologo /p:Configuration=Release /verbosity:minimal ./QuickTestProject.csproj
}

package(){
   cd "${pkgdir}"

   install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
   install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
   echo "copy templates"
   mkdir -p "${pkgdir}/opt/${_pkgbase}/"
   cp -vr "${srcdir}/QuickTester/QuickTestProject/TemplateProjects" "${pkgdir}/opt/${_pkgbase}/"
   install -Dm755 "${srcdir}/QuickTester/QuickTestProject/bin/Release/QuickTestProject.exe" "${pkgdir}/opt/${_pkgbase}/${_pkgname}.exe"
   install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin"
}

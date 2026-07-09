# Maintainer: Laoyou2333 <laoyou2333@confidesk.com>
pkgname=clamui
pkgver=0.3.0
pkgrel=1
pkgdesc="ClamUI is a modern Linux desktop application that provides a graphical user interface for the ClamAV antivirus command-line tool."
arch=('any')
url="https://clamui.com"
license=('MIT')
provide=('clamui' 'python-clamui')
depends=('python' 'python-gobject' 'python-cairo' 'gtk4' 'clamav' 'polkit' 'python-requests' 'python-urllib3' 'python-keyring' 'python-matplotlib' 'python-hatchling' 'python-psutil' 'python-pillow' 'libadwaita')
source=("git+https://github.com/linx-systems/clamui#tag=v${pkgver}"
'io.github.linx_systems.ClamUI.desktop'
'clamui-scan-nautilus.sh'
'clamui-virustotal-nautilus.sh'
'io.github.linx_systems.ClamUI.png'
'io.github.linx_systems.ClamUI.svg'
'io.github.linx_systems.ClamUI-virustotal.desktop'
'io.github.linx_systems.ClamUI.service.desktop'
'io.github.linx_systems.ClamUI.metainfo.xml'
'io.github.linx_systems.ClamUI-virustotal.nemo_action'
'io.github.linx_systems.ClamUI.nemo_action'
'io.github.linx_systems.ClamUI.policy')
sha256sums=('SKIP'
            'c4af7a37261f63a7b13cd1c9cfc32f66058400749631bd559c3d03b0484f06c2'
            '6e61b28b1425b6d77e055657bdedd60b7f4027eba22c2ddb7c1ce6ebd164f01d'
            '9f1c0ac99e976ccc0d07941db9cc3909f454ece08aa05e9c1ac72512fe1b050d'
            '667ee2aa29ec2d238d353123297967203872412d7b1dadae179612ae937a0a48'
            '70ea5c696cdc3e2ba6ea14914a32c72f6bde234d1ed1b8c9e0396ff5de02879c'
            '79db50995efcc501927974f8a6e576b3c8a6d5e8654f312c974068676b04cd6c'
            '749b3e030f6347c3caf1fc6752269065d205e589ce56b8844474c9c8c913ad74'
            '6b7f02a0b91d86ca11d0c76ce92ad3fddcb8633be5d723031664e42977fde7d6'
            '2e48cec11ca4ed1121beb47af6608011b1d433e85f44c39ed93a0afd5135bdc6'
            'fb25387adc982d0dee15585067eeb90d152af73d75c660d96682c9d6718a97c5'
            '99aa86054cb311d03854f8509978c9526ebc3f4bec0dd6221b682e68cc1c77db')

build() {
    cd ${pkgname}
    python -m build --wheel --no-isolation
}
package() {
    cd ${pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.desktop" "${pkgdir}/usr/share/applications/io.github.linx_systems.ClamUI.desktop"
    install -Dm644 "${srcdir}/clamui-scan-nautilus.sh" "${pkgdir}/usr/share/clamui/integrations/clamui-scan-nautilus.sh"
    install -Dm644 "${srcdir}/clamui-virustotal-nautilus.sh" "${pkgdir}/usr/share/clamui/integrations/clamui-virustotal-nautilus.sh"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.linx_systems.ClamUI.png"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.linx_systems.ClamUI.svg"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI-virustotal.desktop" "${pkgdir}/usr/share/kio/servicemenus/io.github.linx_systems.ClamUI-virustotal.desktop"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.service.desktop" "${pkgdir}/usr/share/kio/servicemenus/io.github.linx_systems.ClamUI.service.desktop"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI-virustotal.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/io.github.linx_systems.ClamUI-virustotal.desktop"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.service.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/io.github.linx_systems.ClamUI.service.desktop"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.linx_systems.ClamUI.metainfo.xml"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI-virustotal.nemo_action" "${pkgdir}/usr/share/nemo/actions/io.github.linx_systems.ClamUI-virustotal.nemo_action"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.nemo_action" "${pkgdir}/usr/share/nemo/actions/io.github.linx_systems.ClamUI.nemo_action"
    install -Dm644 "${srcdir}/io.github.linx_systems.ClamUI.policy" "${pkgdir}/usr/share/polkit-1/actions/io.github.linx_systems.ClamUI.policy"
}

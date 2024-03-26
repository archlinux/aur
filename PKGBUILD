# Maintainer: ZhangHua<zhanghua.00 at qq dot com>

pkgname=aria2cd
pkgver=1.4.2
pkgrel=1
pkgdesc="A systemd Service to start aria2 automatically."
arch=("any")
url="https://aur.archlinux.org/packages/aria2cd"
license=(LicenseRef-WTFPL)
optdepends=(
    'curl: for getting tracker list')
source=(
    tracker-config.sh
    update-aria2-tracker
    notify-user-and-copy-config
    ${pkgname}.hook
    aria2-tracker-update-user.service
    aria2-tracker-update-user.timer
    aria2-user.service
    aria2-user.target
    aria2-tracker-update-system.service
    aria2-tracker-update-system.timer
    aria2-system.service
    aria2-system.target
    aria2@.service
    LICENSE::http://www.wtfpl.net/txt/copying
)
sha256sums=('70ff5d088f62cebd2168eca1fd528e4928ac162865c8f5253f9dea171c4184c6'
            '2ec2934bd03d633acb766edee4863cd4fa4a5700d6016e2a6bbf1837e6d11084'
            '9cd38a1658d6ce2d904da10e7c639c3b4730c3f1fc559a6f2f6e2d6a9c8dc8ec'
            'bdfecc359414d95396c6d19990e262d82a3240a01645a96e38e351fc8c27846e'
            '6f0171608c2352fe6be43da813fc01d656d9c19a2dab0b393521c7b0d842ec4f'
            'f3a81fd686335d8f45bc3aa3075979da40b93945d9b155c0e00d259de94499c1'
            '67da4cac7f24a783cb53e3bf6144a9d913782fa5b2e7539aa77440ec2e4a3996'
            '6b4ce82e1678e199aca41f8e7017174a4a7e3f0be4e7ae4977ba716d650b4fbc'
            '5b2d19aae1b462103ae9226aedebbf406103722823aa193a6e6ca4eca600c81a'
            'f11e1d678b0fcd14f961b1e3ba7888f7ce76fc27e81fc5d6e8e442527e7a0d0d'
            '792ab59a0bb4c6123b0f4537174f125b7ed528a96aaa24a24e84b7ec169da916'
            '0922a3e463c1c936f24af896cf56e2f2fc9852cc7f7ae4a47bd64be917ff7e85'
            '0f4a3901b8b32b0842c5dc6765d808585cb4611561114511867eba65cd3facc1'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')
package(){
    depends=(aria2 systemd)
    install -Dm644 "${srcdir}/tracker-config.sh" "${pkgdir}/usr/share/aria2/tracker-config.sh"
    install -Dm644 "${srcdir}/aria2@.service" "${pkgdir}/usr/lib/systemd/system/aria2@.service"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
    install -Dm755 "${srcdir}/notify-user-and-copy-config" \
        "${pkgdir}/usr/share/libalpm/scripts/notify-user-and-copy-config"
    install -Dm755 "${srcdir}/update-aria2-tracker" "${pkgdir}/usr/bin/update-aria2-tracker"
    for target in user system
    do
        install -Dm644 "${srcdir}/aria2-tracker-update-${target}.service" \
            "${pkgdir}/usr/lib/systemd/${target}/aria2-tracker-update.service"
        install -Dm644 "${srcdir}/aria2-tracker-update-${target}.timer" \
            "${pkgdir}/usr/lib/systemd/${target}/aria2-tracker-update.timer"
        install -Dm644 "${srcdir}/aria2-${target}.service" \
            "${pkgdir}/usr/lib/systemd/${target}/aria2.service"
        install -Dm644 "${srcdir}/aria2-${target}.target" \
            "${pkgdir}/usr/lib/systemd/${target}/aria2.target"
    done
}

# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=google-cloud-cli-firestore-emulator
pkgver=549.0.0
pkgrel=1
pkgdesc='A google-cloud-cli component that provides a local, in-memory emulator for Firestore.'
arch=('x86_64')
url='https://cloud.google.com/firestore/docs/emulator'
license=('Apache-2.0')
depends=('google-cloud-cli' 'java-runtime')
options=('!strip')
source=("https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('4702a02da9eb8267cd9ab3f3a6f59640af35085c100160d8f4cf67068ff50de9')

package() {
    cd "$srcdir/google-cloud-sdk"  # Does not match naming convention google-cloud-cli

    local _install_base="${pkgdir}/opt/google-cloud-cli"
    local _component_path="platform/cloud-firestore-emulator"

    # Install component manifest and snapshot
    manifests=(
        "cloud-firestore-emulator.manifest"
        "cloud-firestore-emulator.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 ".install/${item}" "${_install_base}/.install/${item}"
    done

    install -Dm755 "${_component_path}/cloud_firestore_emulator" "${_install_base}/${_component_path}/cloud_firestore_emulator"
    install -Dm644 "${_component_path}/cloud-firestore-emulator.jar" "${_install_base}/${_component_path}/cloud-firestore-emulator.jar"
}

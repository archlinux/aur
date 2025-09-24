# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=google-cloud-cli-firestore-emulator
pkgver=540.0.0
pkgrel=1
pkgdesc='A google-cloud-cli component that provides a local, in-memory emulator for Firestore.'
arch=('x86_64')
url='https://cloud.google.com/firestore/docs/emulator'
license=('Apache-2.0')
depends=('google-cloud-cli' 'java-runtime')
options=('!strip')
source=("https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('1ca3b8443b690d72153a5ad16c63cf4186a9680cf46fd9c468f9bcc4fb2fdd1c')

package() {
    cd "$srcdir/google-cloud-sdk"  # Does not match naming convention google-cloud-cli

    # Install component manifest and snapshot
    manifests=(
        "cloud-firestore-emulator.manifest"
        "cloud-firestore-emulator.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 \
            ".install/${item}" \
            "${pkgdir}/opt/google-cloud-cli/.install/${item}"
    done

    install -Dm755 \
        "platform/cloud-firestore-emulator/cloud_firestore_emulator" \
        "${pkgdir}/opt/google-cloud-cli/platform/cloud-firestore-emulator/cloud_firestore_emulator"

    install -Dm644 \
        "platform/cloud-firestore-emulator/cloud-firestore-emulator.jar" \
        "${pkgdir}/opt/google-cloud-cli/platform/cloud-firestore-emulator/cloud-firestore-emulator.jar"
}

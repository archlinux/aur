# Maintainer: WithTheBraid <info@braid.business>
# Co-Maintainer: Polarian <polarian@polarian.dev>, Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=flutter
pkgver=3.19.3
_dartver=3.3.1
_enginever=2e4ba9c6fb499ccd4e81420543783cc7267ae406
_materialfontsver=3012db47f3130e62f7cc0beabff968a33cbec8d8
_gradlewver=fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa
_flutterarch=$(uname -m | sed s/aarch64/arm64/ | sed s/x86_64/x64/)
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64" "aarch64")
url="https://${pkgname}.dev"
license=("custom" "BSD" "CCPL")
depends=( 
	 "dart>=${_dartver}"
	 # instead of bundled Gradle Wrapper
	 "gradle"
	 # commands first
	 "bash"
	 "curl"
	 "file" # base-devel, but runtime dependency
	 "git"
	 "coreutils" # explicit dependency to mkdir, rm
	 "unzip"
	 "which" # base-devel, but runtime dependency
	 "xz"
	 "zip"
	 # runtime shared libraries
	 "glu" # libGLU.so.1 required for flutter test
	 "libglvnd" # https://github.com/flutter/engine/pull/16924
)
makedepends=("jq")
optdepends=("android-sdk: develop for Android devices"
	    "java-environment: develop for Android devices"
            "android-studio"
            "intellij-idea-community-edition"
            "intellij-idea-ultimate-edition"
	    "clang: clang++ is required for Linux development"
	    "cmake: CMake is required for Linux development"
            "ninja: ninja is required for Linux development"
	    "pkgconf: pkg-config is required for Linux development" # base-devel, but runtime dependency
	    "gtk3: GTK 3.0 development libraries are required for Linux development")
options=("!emptydirs")
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.xz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver/.hotfix/+hotfix}.tar.gz"
  # material_fonts
  "material_fonts.zip::https://storage.googleapis.com/flutter_infra_release/flutter/fonts/${_materialfontsver}/fonts.zip"
  # gradle_wrapper
  # we use the arch system gradle to create that one
  # "gradle_wrapper.tar.gz::https://storage.googleapis.com/flutter_infra_release/gradle-wrapper/${_gradlewver}/gradle-wrapper.tgz"

  # engine/android-arm-profile/linux-x64
  "android-arm-profile-linux.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm-profile/linux-x64.zip"
  # engine/android-arm-release/linux-x64
  "android-arm-release-linux.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm-release/linux-x64.zip"
  # engine/android-arm64-profile/linux-x64
  "android-arm64-profile-linux.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm64-profile/linux-x64.zip"
  # engine/android-arm64-release/linux-x64
  "android-arm64-release-linux.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm64-release/linux-x64.zip"
  # engine/android-x64-profile/linux-x64
  "android-x64-profile-linux.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x64-profile/linux-x64.zip"
  # engine/android-x64-release/linux-x64
  "android-x64-release-linux.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x64-release/linux-x64.zip"

  # engine/android-x86
  "android-x86.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x86/artifacts.zip"
  # engine/android-x64
  "android-x64.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x64/artifacts.zip"
  # engine/android-arm
  "android-arm.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm/artifacts.zip"
  # engine/android-arm-profile
  "android-arm-profile.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm-profile/artifacts.zip"
  # engine/android-arm-release
  "android-arm-release.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm-release/artifacts.zip"
  # engine/android-arm64
  "android-arm64.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm64/artifacts.zip"
  # engine/android-arm64-profile
  "android-arm64-profile.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm64-profile/artifacts.zip"
  # engine/android-arm64-release
  "android-arm64-release.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-arm64-release/artifacts.zip"

  # engine/android-x64-profile
  "android-x64-profile.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x64-profile/artifacts.zip"
  # engine/android-x64-release
  "android-x64-release.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x64-release/artifacts.zip"
  # engine/android-x86-jit-release
  "android-x64-jit-release.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/android-x86-jit-release/artifacts.zip"

  # flutter_web_sdk
  "flutter_web_sdk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/flutter-web-sdk.zip"
  # pkg
  "sky_engine.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/sky_engine.zip"

  # engine/common
  "flutter_patched_sdk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/flutter_patched_sdk.zip"
  # engine/common
  "flutter_patched_sdk_product.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/flutter_patched_sdk_product.zip"

  # engine/linux-$ARCH
  "engine-${_flutterarch}.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/linux-${_flutterarch}/artifacts.zip"
  # engine/linux-$ARCH
  "gtk-debug-${_flutterarch}.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/linux-${_flutterarch}-debug/linux-${_flutterarch}-flutter-gtk.zip"
  # engine/linux-$ARCH-profile
  "gtk-profile-${_flutterarch}.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/linux-${_flutterarch}-profile/linux-${_flutterarch}-flutter-gtk.zip"
  # engine/linux-$ARCH-release
  "gtk-release-${_flutterarch}.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/linux-${_flutterarch}-release/linux-${_flutterarch}-flutter-gtk.zip"
  # engine/linux-$ARCH
  "font-subset.zip::https://storage.googleapis.com/flutter_infra_release/flutter/${_enginever}/linux-${_flutterarch}/font-subset.zip"

  # thanks to lauren n. liberda from Alpine for the awesome patchset used here !
  "${pkgname}.sh"
  "version.patch"
  "system-dart.patch"
  "no-lock.patch"
  "no-runtime-download.patch"
  "doctor.patch"
  "opt-in-analytics.patch"
)
noextract=(
  "material_fonts.zip"
  # "gradle_wrapper.tar.gz"

  "android-arm-profile-linux.zip"
  "android-arm-release-linux.zip"
  "android-arm64-profile-linux.zip"
  "android-arm64-release-linux.zip"
  "android-x64-profile-linux.zip"
  "android-x64-release-linux.zip"

  "android-x86.zip"
  "android-x64.zip"
  "android-arm.zip"
  "android-arm-profile.zip"
  "android-arm-release.zip"
  "android-arm64.zip"
  "android-arm64-profile.zip"
  "android-arm64-release.zip"

  "android-x64-profile.zip"
  "android-x64-release.zip"
  "android-x64-jit-release.zip"

  "flutter_web_sdk.zip"
  "sky_engine.zip"
  "flutter_patched_sdk.zip"
  "flutter_patched_sdk_product.zip"

  "engine-${_flutterarch}.zip"
  "gtk-debug-${_flutterarch}.zip"
  "gtk-profile-${_flutterarch}.zip"
  "gtk-release-${_flutterarch}.zip"
  "font-subset.zip"
)
sha256sums=('f6d9a4300799c0482ae499506ef53361f150fecdb4ef7fd5bb8615a97db09c18'
            'e56fa8e9bb4589fde964be3de451f3e5b251e4a1eafb1dc98d94add034dd5a86'
            '9df5519f282add92e9b7e65e8a2d3c1fc59c44501ab9e49b05d8eb9ed88eda22'
            'ce428acfd906305009d923110cca685a4d7a53aa01f3c68bc30a46cf7007a53d'
            '9d8f7dc5da13a290ca5268ce422dc229a20a3187144ef7ddf770ef58deccf9f3'
            'cdcbab0bc73417699d02eb52d51086cd85a9864befa79367d63ae6f6c4e6b0b9'
            '32c549ebd1bd3f69ae6e06e28a0d15b1c889d3d4853d8c14b3857198a8c810c5'
            '26010429cc90306f30f0228bc93dd672781d6c5812d3d47ebcafbd352a370c34'
            '678b48bbece6258dcea2ad75d77fcf5e2f06a1d36fa574aeb72c533ac5f2d2cb'
            '9f07e8ad3ae060f77a51977f5a8a69046347c91b7a4912f1341fb1cc4931b940'
            'da574374daa9426022e1ec8051fd2b70bc19d041ed36fa73f979a2deab542d7d'
            'd3977435a04b419f8eeac61400bec1d2fd126767c7efe09906c3020bd2d521fa'
            '710228c4038259f5a1f9d1b185c06e95fb52b843239d8236fb87dfd3dab6de25'
            'be3a0590b3154d207e47848c6291bb9dbeb689f8bebece51e20691fde0f45725'
            '1137124ebab42e0ba894fdb61c1f276aa1c3e349acec7e9f8d2df7142c35ef5a'
            '213e3e250fae3e5990e4498991510116d3823c6f76bcc788ff5b00568a7df355'
            '89f11f867aa595e95b66f252ff6d36be5c19b0cc16c1fab1521899557f1607fb'
            'd69da3173a9c1e2006d4af5ab4db513b3be37547fab508dcde064438cef853bf'
            '941d88252aaa440f5dcb30e94905af2e5082e687e1a9d8945af272e411cd6cbe'
            'e056c8bbe885e311459882428166fdc5cadab58c2d7846c0ac9219de56b9c84b'
            'f54dfd037abab488994da87d605c9f0fa2d4286e988d13a3d80b95e0ad43b684'
            'b9309b103b4f47d3309c5ca20faac8ae83d62efb08af92429e1109168406181f'
            'cfb930fb2c4fff0e6501319b2fda9a4de514ee69de39c3291ff1f99126849a85'
            '3d9e78fd013988741ad4f501e0eca9cf4054a23edc07b3524b4312b8c0a11ab7'
            'd2d07ea444cc8b45fa09354978ffb25ddfe4d2d653f799a7095ed2aa98dde36a'
            'ceb71fb844b7011a61c7a8294ba616915c6f9c84c72a397f4981aeb0092e6bc6'
            '3657a21f8ad7851c3293eba6701a3c682ad7604aaba9714e6b5877aae7861e46'
            '87c074449d4a76e7e0c1913d7361fca8c9d0573233b3996b56b3fc05d3ba0cf9'
            '54db9347ac6467b806fff70f62b2709276a0ca4d82468ae8357d5520db0ad04a'
            '688a7d6a3c220cf09f7e48af46f1ef1b01d251679962c825eded0b3fa4fc2ab1'
            'a5516dda7451eec10a2c0069f5a2e01c6de63a16332c3e2d8a94e27b520f8d9e'
            '544d08716332a9f9358b21010d468b84a9edff0da7bbb1baf0cf4d6322821ea5'
            'a5f19e68e9e4790d017dc4988e715f51c44548df5615aae6106d1a0c84fe49f1'
            '04531ee1732c18c933b5b28f5da88ed183d5aa3698b1d1e912c000928b93ec91'
            '1578e819b6ee479b6db7a095bcfa74372d3ff555642c6d6ea7112e97bb6f2027')

prepare() {
  mv "${srcdir}/${pkgname}-${pkgver/.hotfix/+hotfix}" "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/version.patch" -d "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/system-dart.patch" -d "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/no-lock.patch" -d "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/no-runtime-download.patch" -d "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/doctor.patch" -d "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/opt-in-analytics.patch" -d "${srcdir}/${pkgname}"

  echo "${pkgver}" > "${srcdir}/${pkgname}/version"
  mkdir -p "${srcdir}/${pkgname}/bin/cache/artifacts"
  cat > "${srcdir}/${pkgname}/bin/cache/flutter.version.json" <<EOF
{
	"frameworkVersion": "$pkgver",
	"channel": "$_channel",
	"repositoryUrl": "https://github.com/flutter/flutter.git",
	"frameworkRevision": "archlinuxaur0000000000000000000000000000",
	"frameworkCommitDate": "2038-01-19 03:14:08",
	"engineRevision": "$(cat "${srcdir}/${pkgname}/bin/internal/engine.version")",
	"dartSdkVersion": "$_dartver",
	"devToolsVersion": $(jq '.version' < /opt/dart-sdk/bin/resources/devtools/version.json),
	"flutterVersion": "$pkgver"
}
EOF

  mkdir "${srcdir}/gradlew"
  pushd ${srcdir}/gradlew
  gradle init --use-defaults --type basic --project-name flutter --dsl groovy
  gradle wrapper
  popd

  cd "${srcdir}/${pkgname}/bin/cache"

  unzip -o -q "${srcdir}/flutter_web_sdk.zip" -d flutter_web_sdk
  unzip -o -q "${srcdir}/sky_engine.zip" -d pkg

  cd "${srcdir}/${pkgname}/bin/cache/artifacts"

  # why should we use a pre-build gradle wrapper if we have it in the arch repos ?
  mkdir -p gradle_wrapper/gradle
  cp -pr "${srcdir}/gradlew/gradle/wrapper" gradle_wrapper/gradle
  cp -pr "${srcdir}/gradlew/gradlew" gradle_wrapper

  # mkdir "gradle_wrapper"
  # tar -xzf "${srcdir}/gradle_wrapper.tar.gz" -C "gradle_wrapper"
  unzip -o -q "${srcdir}/material_fonts.zip" -d "material_fonts"

  mkdir -p engine/android-arm-profile
  mkdir -p engine/android-arm64-profile
  mkdir -p engine/android-x64-profile
  mkdir -p engine/android-arm-release
  mkdir -p engine/android-arm64-release
  mkdir -p engine/android-x64-release

  unzip -o -q "${srcdir}/android-arm-profile-linux.zip" -d engine/android-arm-profile/linux-x64
  unzip -o -q "${srcdir}/android-arm-release-linux.zip" -d engine/android-arm-release/linux-x64
  unzip -o -q "${srcdir}/android-arm64-profile-linux.zip" -d engine/android-arm64-profile/linux-x64
  unzip -o -q "${srcdir}/android-arm64-release-linux.zip" -d engine/android-arm64-release/linux-x64
  unzip -o -q "${srcdir}/android-x64-profile-linux.zip" -d engine/android-x64-profile/linux-x64
  unzip -o -q "${srcdir}/android-x64-release-linux.zip" -d engine/android-x64-release/linux-x64

  unzip -o -q "${srcdir}/android-x86.zip" -d engine/android-x86
  unzip -o -q "${srcdir}/android-x64.zip" -d engine/android-x64
  unzip -o -q "${srcdir}/android-arm.zip" -d engine/android-arm
  unzip -o -q "${srcdir}/android-arm-profile.zip" -d engine/android-arm-profile
  unzip -o -q "${srcdir}/android-arm-release.zip" -d engine/android-arm-release
  unzip -o -q "${srcdir}/android-arm64.zip" -d engine/android-arm64
  unzip -o -q "${srcdir}/android-arm64-profile.zip" -d engine/android-arm64-profile
  unzip -o -q "${srcdir}/android-arm64-release.zip" -d engine/android-arm64-release

  unzip -o -q "${srcdir}/android-x64-profile.zip" -d engine/android-x64-profile
  unzip -o -q "${srcdir}/android-x64-release.zip" -d engine/android-x64-release
  unzip -o -q "${srcdir}/android-x64-jit-release.zip" -d engine/android-x86-jit-release

  unzip -o -q "${srcdir}/flutter_patched_sdk.zip" -d engine/common
  unzip -o -q "${srcdir}/flutter_patched_sdk_product.zip" -d engine/common

  unzip -o -q "${srcdir}/engine-${_flutterarch}.zip" -d engine/linux-${_flutterarch}
  unzip -o -q "${srcdir}/gtk-debug-${_flutterarch}.zip" -d engine/linux-${_flutterarch}
  unzip -o -q "${srcdir}/gtk-profile-${_flutterarch}.zip" -d engine/linux-${_flutterarch}-profile
  unzip -o -q "${srcdir}/gtk-release-${_flutterarch}.zip" -d engine/linux-${_flutterarch}-release
  unzip -o -q "${srcdir}/font-subset.zip" -d engine/linux-${_flutterarch}

}

build() {
  export PUB_CACHE="${srcdir}/${pkgname}/pub-cache"
  cd "${srcdir}/${pkgname}"
  dart pub get -C "packages/flutter_tools" --no-offline --no-precompile
  dart --verbosity=error --disable-dart-dev \
		--snapshot="bin/cache/flutter_tools.snapshot" --snapshot-kind="app-jit" \
		--packages="packages/flutter_tools/.dart_tool/package_config.json" \
		--no-enable-mirrors "packages/flutter_tools/bin/flutter_tools.dart" --version
 cd ../..

  sed -Ei 's|'"$PUB_CACHE"'|/usr/lib/flutter/pub_cache|g' "${srcdir}/${pkgname}/packages/flutter_tools/.dart_tool/package_config.json"
  find "$PUB_CACHE" -name '*.aot' -delete
}

package() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${pkgname}" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/flutter"

  # didn't find a workaround other than keeping that one still user writable
  install -dm777 "${pkgdir}/usr/lib/${pkgname}/packages/flutter_tools/gradle/.gradle"
  install -dm777 "${pkgdir}/usr/lib/${pkgname}/packages/flutter_tools/gradle/build"
  touch "${pkgdir}/usr/lib/${pkgname}/packages/flutter_tools/gradle/.gradle/.keep"
  touch "${pkgdir}/usr/lib/${pkgname}/packages/flutter_tools/gradle/build/.keep"
}

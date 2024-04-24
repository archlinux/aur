# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pascal Ernster <archlinux@hardfalcon.net>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://github.com/stha09/chromium-patches/releases

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=25.9.8
# _gcc_patches=114-patchset-1
pkgrel=6

_major_ver=${pkgver%%.*}
pkgname="electron${_major_ver}"
pkgdesc='Build cross platform desktop apps with web technologies'
arch=(x86_64)
url='https://electronjs.org'
license=(MIT BSD-3-Clause)
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         nss # libnss3.so
         zlib libz.so)
makedepends=(clang
             git
             gn
             gperf
             harfbuzz-icu
             http-parser
             java-runtime-headless
             libnotify
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs whith is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-hydrogen
             npm
             patchutils
             pciutils
             pipewire
             python
             python-httplib2
             python-pyparsing
             python-requests
             python-six
             qt5-base
             wget
             yarn)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        REVERT-disable-autoupgrading-debug-info.patch
        add-some-typename-s-that-are-required-in-C-17.patch
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        icu-74.patch
        jinja-python-3.10.patch
        libxml2-2.12.patch
        random-fixes-for-gcc13.patch
        std-vector-non-const.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=114.0.5735.289
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=16fa32231e2ccd89d2804b3f765319128b20c4ac
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v18.15.0
        chromium-mirror_buildtools_clang_format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=f97059df7f8b205064625cdb5f97b56668a125ef
        chromium-mirror_buildtools_third_party_libc++_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=bff81b702ff4b7f74b1c0ed02a4bcf6c2744a90b
        chromium-mirror_buildtools_third_party_libc++abi_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=307bd163607c315d46103ebe1d68aab44bf93986
        chromium-mirror_buildtools_third_party_libunwind_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=2795322d57001de8125cfdf18cef804acff69e35
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=417e89893751ee0fea04c86edf386f1eff0e2c96
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=02c69dd28eef7ef2618782e8d54d53c14ae64382
        chromium-mirror_third_party_android_ndk::git+https://chromium.googlesource.com/android_ndk.git#commit=8388a2be5421311dc75c5f937aae13d821a27f3d
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=ce590bee825a18785f86d096f2c7be06428ccf88
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=b8744f00646d175057f0be7443c7c72a311b5381
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=d426d1c91075b9c552b12dd052af1cd0368f05a2
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=bf86a1c8d463d7b9a556b10a80d17990d413831c
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8f20644eca693cfb74aa795b0006b6779c370e7a
        chromium-mirror_third_party_google_benchmark_src::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=b177433f3ee2513b1075140c723d73ab8901790f
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=4b6d950d8921d6dd5365de0797fcc97302b9561b
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=bfde407de559c10d6cef861b3873ff287c24e761
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=e42ef68aa05ac0c163805f60b9b19284f3c2dee3
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=cae7ec667dee9f5c012b54ee9ffee94eb7beda14
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=beb46ca0319882f262e682dd596880c92830687f
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=73d6b816cacd86b886b4cc1e60f12ac1960f1d90
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=cdc33384bfa900dfec28e6cf7b5f22cd7ff2c92f
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=6e714e6dfe62110c95fafed4bdeb365a69c6a77e
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=3f60fe50e4790d1154659b9628e811bbcdf1aa4f
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=554fe02ae3f3fbc2fd320c26a522f1e59b2d6342
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=8d21d41d8bec5c0b266ee305d1a708dc5c23b594
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=a56f9ec50e908362e20254fcef28e62a2f148d91
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=06929a556fdc39c8fe12965b69070c8df520a33e
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=822dab21d9995c5cf942476b35ca12a1aa9d2737
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=0a3836c97d5e84d6721ac0fd2839e8ae1b7be8d9
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=2175f5d050743317c563ec9414e0f83a47f7fbc4
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=cd53f7c0d6a1c005e38874d143c8876d375bae70
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=af29db7ec28d6df1c7f0f745186884091e602e07
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=d8daa943f64cd5dd2a55e9baf2e655ab4bfa5ae9
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=068d5ee1a3ac40dabd00d211d5013af44be55bea
        chromium-mirror_third_party_libFuzzer_src_electron25::git+https://chromium.googlesource.com/chromium/llvm-project/compiler-rt/lib/fuzzer.git#commit=debe7d2d1982e540fbd6bd78604bf001753f9e74
        chromium-mirror_third_party_centipede_src::git+https://chromium.googlesource.com/external/github.com/google/centipede.git#commit=a5a9071410e6e8134855b88461d0eb2c77d48cdd
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=5a0903824082f41123e8365b5b99ddb6ced8971c
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=1af8cea3d1b3a05ecbcb0e39d99a7f0183e6ce13
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=37000006c224476104276bf74038d60967593814
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=0971e0c09f748dd476089b0e5136fe0b84e0bb4c
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=b9ca37b3134861048986b75896c0915cbf2e97f9
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=441f98d02deafd9b090aea568282b28f66a50e36
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=aa4075f116e4312537d0d3e9dbd5e31096539f94
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=5b7c744eb8310250ccc534f3f86a2015b3887a0a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=27171320f5e36f7b18071bfa1d9616863ca1b4e8
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=fd7b5d48464475408d32d2611bdb6947d4246b97
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=77c2121f7e6b8e694d6e908bbbe9be24214097da
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=bd6537fb1c4aa2164d97f96e78a9c826e360a0ed
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=7fc833e889d1afda72c06220e5bed8fb43b2e5ce
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=09a4f3ec842a8932341b195c5b01e141c8a16eb7
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=0964c1e903264ae2c388fc0eda3309c22b46e1a2
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=bf21ccb1007bb531b45d9978919a56ea5059c245
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=9505810f66cc3dde86c30d072de53ca6fc8a45de
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=f2da6df2f144e41e1c1428f11e8b388eaf8a2209
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=1787867f6183f056420e532eec640cba25efafea
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=11073deb73b3d01018308863c0bcdfd0d51d3e70
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=363f252289fb7a1fba1703d99196524698cb884d
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=ea1a1635fcf5b1f68b59cd3f8649a0abfab65cfd
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=c9f9edf6d75bb065fa47468bf035e051a57bec7c
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=f6752b7ed1fe3cc1491c0c47ec5804ee2bd0e59b
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=23e97b79fb9193bf88e79c16c6a577c680edb2d6
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=ab14323eaf8522fa608fe047d99249bc844c47cd
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=a52479099cf2862650df9dbc12e2e202e345901e
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=ebe84bec02c041d28f902da0214bf442743fc907
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=c7473676b8abc682e820546287044cee3bca9147
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=4624cfaaf563cd7be5e2e2087c8de6d3a48ea867
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=d1b65aa5a88f6efd900604dfcda840154e9f16e2
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=7d2d22292ce5af280c8c5849ed7f0679d7ab70e9
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=151be743d4c83671565f9c1eada3f4a0b2e44dea
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=fe9d08f2b6e80af691bfb1a718e144c49a1b9eba
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=420cfd00f2de91de74bd9d4d8348e43c582d29f0
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=d80274d5869b17b8c9067a1022e4416ee7ed5e0d
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=b9d4073a6913891ce9cbd8965c8d506075d2a45a
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=6be0a66a1ebd7ebc5abc1b2f405a945f6d871521
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=978934af4a291282d994fc184d5dc03a82deb5df
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=e3b9db9ad121f46b7943d0152a25d5ee9afaa13c
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=1103ef535ca1e100db5d4e59781a4e59369a9818
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=2ff42d2008f09f65de12e70c6ff0ad58ddb090ad
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=effd9257d456f2d42e9e22fa4f37a24d8cf0b5b5
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=166db27fd0d53afc0c716b1ae9c15725e380871f
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=ee69aa00ee8536f61db6a451f3858745cf587de6
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0944e71f4b2cb9a871bcbe353f95e889b64a611a
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=62e175ef9fae75335575964c845a302447c012c7
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=64bbf988543996eb8df9a86877b32917187eba8f
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=bc3ab29356a081d0b5dd4ac55e30f4b45d8794cc
        chromium-mirror_third_party_dawn_third_party_protobuf_electron25::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf.git#commit=fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        chromium-mirror_third_party_vulkan-deps_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=9c7fd1a33e5cecbe465e1cd70170167d5e40d398
        chromium-mirror_third_party_vulkan-deps_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=fc9bee27f445644635e83ef111ef54944bb6e3af
        chromium-mirror_third_party_vulkan-deps_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=cfbe4feef20c3c0628712c2792624f0221e378ac
        chromium-mirror_third_party_vulkan-deps_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=25ad5e19f193429b737433d5f6151062ddbc1680
        chromium-mirror_third_party_vulkan-deps_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=8a397558c4d2a4bf9e64e900c45a7e65664c32b2
        chromium-mirror_third_party_vulkan-deps_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=f035e57c171ce9009f2c47b5488a66c653843501
        chromium-mirror_third_party_vulkan-deps_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=df10a2759b4b60d59b735882217a749d8e5be660
        chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=3d530f6921f7a9defa297eec25fcef77c9b96282
        # END managed sources
       )
sha256sums=('80313357763a5be3f0e1ba7294c50bf8537938902cf7d86494a35febede57b6d'
            '1b782b0f6d4f645e4e0daa8a4852d63f0c972aa0473319216ff04613a0592a69'
            '621ed210d75d0e846192c1571bb30db988721224a41572c27769c0288d361c11'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'b406bc9adb7fadcfbd26f204f3e0ef8c31a41fa09181edb28626167ac58fe038'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '547e092f6a20ebd15e486b31111145bc94b8709ec230da89c591963001378845'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'bfae9e773edfd0ddbc617777fdd4c0609cba2b048be7afe40f97768e4eb6117e'
            'ba4dd0a25a4fc3267ed19ccb39f28b28176ca3f97f53a4e9f5e9215280040ea0'
            '893bc04c7fceba2f0a7195ed48551d55f066bbc530ec934c89c55768e6f3949c'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '3ae82375ba212c31fd4ba6f1fa4e2445eeca8eb8c952176131ad57c0258db224'
            '990c2af17b61076fe36ea6f15912af0c9e183ecacdaa8d360bfbd245c0c10f81'
            '3d5af1414e90349a6f412d8264c9b613346a38adecf226447d1d0d511f9410d3'
            'ff314976d3a281728936672db3316c9f359957abdfebf9edbaed4862835473b8'
            '3ff2f108019f2639c665a0f15d45b40c900683e1fd5643f7c4ca589c1e87d9e0'
            '048a975e6dca2e34228a87139bce28eb01ea321eebd397c2bd00b4a886713c7c'
            '74d62e16e231f8bef4040efd1258d2a9459bfe338cc7977cc10e80ecf897e707'
            '250ed71ad5940edb9d94d84e865fd4aac9b64f2e75c5f28108e555154301cc4b'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            'a62dd76d5ebcae2e2302509f057d21c35ffd69549ee7cdac47b2a85616dcc9be'
            '301a488e33a20a9587088cba304e663e01caf520e195460eebabe4e38e74cca3'
            '84693fc6a07ccc9d9d10cd810a11476c248f274426880691be8460cd51efd4e7'
            'ae9228e3e775fcdb1e5d18128d7ba5bfff838365734806159a66e82d6dab3288'
            'f034fcf556186dd314c033c13280d20b179eefc3411c50672adcfeff95bb0491'
            'cd20d3f67c34baf1e66d488506db48b9b3022bbd769817ff037e5562ca4935b3'
            '8200e08e8f8a1f3082068abe2256a9df85f4b00fd46053cc17bc2b0f58fe2546'
            'c5608e69ec1dfdbd75e1d865e58cbbae217634db79215a3e3cc6e3811ed44c9b'
            'd6045d4ebf49f14b994e58fbd2a84f95ca43a23f627db19b20cbfad1a0f49016'
            '580078d0e6e5dfd1ae1f935978e04270012fb594ed4ce435bf98963d4541715a'
            '902e376149821e8f6895157f64f8703223d0687ca5910b37386a6f656f1bf940'
            'ba79fa9691ea7d573d9a541f20e7794c9a4bcba075bae503449a24ea6eb23cd9'
            '20e7783deb29e24aa46bdee407fcb083c3e7a682ee51f3b51af12e288dfab800'
            'b216f15abd41dfff1ed8d7ae3cc3c35af4b4b8d4b630dc4e3a53648ca682ee63'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            'f5a4b337697d317878370cb0f7acecc74c076ce0d093a426a746323eb1ee3d7d'
            '4f5fd6719234fbc67c517e20e2170db66d37455d69bec880624a0a0304a0e91c'
            'fc92a32fe0d6fa6e45af35e9334fabbc8b32be97ed977834c5ec87d0770df90d'
            '9fd46021a91d5e3bb3ece7c2696ef4ee147b65318b849f5bfc72f21383723628'
            'eb56547cae201e0014b67dbc1b3ac18e6e595a8e90b8d2ad18cc7eeb95ebb63b'
            'd27ba7fe8036feea8dedf9fcc6ce9b221ca53fd822fc3c0e1a6863fe50c8b7fc'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '2e1f2cd7326bab75ef2c444ba88fbdf15a5e749e76d8a945881476cacc33c8e4'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            '6db50be2c9d88002a2237e37ee6a4f282b623f1522eaba25f65d323aa735984d'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            'b0731644c68b45df8364a1f164851c8cf97d2f23f6fb7e1f26386d13c3ce609d'
            '590333d14900d5117d082a5f31907d09552612f7b864c3ddc4dc0b00012e36c9'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '792d29bbb3fdcfdf21face515e6b9fba1a14ee7bdc82f0cff9620592925425c9'
            '6dbf19447324d50b952e0c0b0252c39ad7f3b5baf2a0752a4582d51a4744fd5e'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'b81acc6932e7a868391f6140bbf064e2d4e18348288172d0d61f10fa342c828e'
            '88cdf771889253831a8873b3234e80cd0b6604bd1fc31a93cff36fa9c2281159'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '5a720c28ef8557e80c4b660b2000529c0de428a05b34d0ced5bc56b1097a69ec'
            '409ee4de1d8d203c839118b398d508788cdd270ec9295b3c5375ac33f39c12af'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '861f8196d355228c995ea5f36cf5e4c93f824a79993aae4c08f37f18276e4c1a'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '0debfc572068aeab2fa4e6e7ba45fc14a402fa735423cc9bbfc5ce94a8cd074d'
            '4fcb8ebca4a72800397c5e08d1c5eae878767f5df960b0e4214d0de775fe160c'
            '177510d529b4e4a3107b0573c88bd831a9156ef1b6cdb32ddb4e41701b22222e'
            '63e3cc92fb9b5b9181082eb8ba1574a11e4c36272d10930c4bd7610fed17308a'
            'a3e928c7ed123f43dd5264c809a38ae23b3247745d88b4dc7dd27ca25b455705'
            'd4a40160cbfe51c798bf53e7852f35fba9f872995c20d57556e5fa6de4974ddf'
            '42016bfa74d38f8691a8d6d8493495835ad0469ed31fb93312f38b0a08813c3a'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '62a3c77ded8f36667dc639da584c4d056b89fde4cce1eb56fe36a689b41d0654'
            '1a273225e8f25d924bea44c42d652306ff721f35b2b57e1b8029dc3396a482b3'
            'cc74c39e0133905a1f4f264590b44282df4231b73972e7a9708b311e46e00f88'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            'baa1f2f43280eab4d42804da031bb6bd007ec24ac32519154696c5f680e0f850'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '698e598c6f94a46eb9a26020a74d8904def28553157712af8afc3e809771ff25'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '19e0febe7b20da08e302ab5c8d426f9172a84d40ef5101210b5fcdac54f6bf7c'
            '7b32c27a5513c451032132fe5dc724de23d3b0738a0609a96bd44deee1d46681'
            '5b213f27fae856eb2abffa5ec1c7d087c51701bdfc63cecf73c4d0e8f017e49d'
            '5fa19da5efdfdddcff9527233c0ef40dcb9a9d1c266d10a947054033e549c801'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'c7ef8205f3c0455cca339e50014c2e07a41e41cce0e872f1c1a788532516a89b'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            'd49593e7559dfd1c0e3d7200b26241fd3116ab487bbd09d2dea30c2478ab77bd'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            '1f3ed3b9c74a3553539687d0797fd29e202e5c00dd465df443420bea36888e4d'
            '55c4cd30a9ef9a01b7280eea13ae24b759bf7d7549103c99d28b0dafaa91db22'
            'b8680bd4b53632b4e7ad590b02214fbd73b4cc73a9fa8cf4e0e3069596c675cd'
            'c14e548e1f1a3c2e87d67f481b48c848cf7044bae766d6b392b3074e511ea52b'
            '5f371ad06486760181fa6ebb6c362b1ee33c12de9967c3e964932928538cedf2'
            '3047e861dc6768a97bb19ab35db13dacf49670a4f5749d0c31a74dda7ae9975e'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'dc1206af7485794e1644097b08736e39c8fa50296e514561f8805c6d28b58925'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            '564559d4862e1abe2cc17f7e29b0bb04379ca19d8db174ffd4c12ff2b1a8c909'
            '4b027a9ea6e4b937b818cc06bd4d9e56bc5943a49dead8ebe8903f13cfd208df'
            '749cf5467642e57cb38581d940e90dedc949221be24ddceed0ad5ee1f5d47776'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'bd724ee01b93651b4ec6ba62ba64d23e153ea7100be760ccaee4a1e6e32787a6'
            'e1c4d77121d49620986bf34b176258f2c97d2a477a9a3bce8fc702e2502d2c14'
            '887e70788bcbc6a46dde13db2cddb141925ba85fa4704baf1bb0c792da026e4f'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            'd3610387e3876fb9b05538a73690cfaa8d6a51daa58ce9fdd05417b28ddd4f8f'
            'a263553586997b8800dfa0f55bf24e235cda3e78ae260104ea4e52b96c6cd77e'
            '965802bae3a0b3809747f4ad117a1d7da3d756a22d0f2bc56f5e4460dce16709'
            '51bc3369ec18057a024c24e079cc0e15afdfb196021e4bdbde800d6ed294632d'
            '814c404aab38032cc56c307ef7b8d9b1443b1743388c36e9395a99e1cedc6a72'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            'b5f1b797e59e54882fbfb9088f79037d050359a00b053f5209a7b1b52aacc541'
            '5d5edb27ce0c9da37e318031bc8277658ed0d2ab93436191a6cf1fff5df1995c'
            '094f8f133ef26303de2c28824d3c36f499a5471a534043b29f8f7b9b4a399f90'
            '6a7be311617446dd1534863e8f3e02159caaa9c4efbc7d2564c83c1a4faaa31b'
            '2d2b64a30b8fdab74ec93f2d4b0eb65a05a4fba5840cad7f89a7e68fdb49c329'
            '8fa4f52720fb5fce6a0cefcdf119f57f3b419078dc543ba9567b77eb7fba8604'
            '4c7ac322f685f62d8296723978b1353718c97c76e884c43a4aed3dcca62e1bc7'
            '71191c953111a08a0e0df6a724bd331a9efb1994b872d2c081f3214324097720'
            'c367b9c650b99c2d2da566fb8fa51b326ddf0263e513977b971b375127180589'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '148affe18a15f15c514864deffcac6460981f7b42228d933f4ee2c06d28b93f6'
            '1b705b1c27472ee5a10c531ab043fd5ebc0229acd3353b040246f1920bfa0737'
            '670d707f588762f5a2bf7f9794f79cbb2f0cf49c798971f673220157bdd5378f'
            'b0214aeba69453365d24e9a717aa1f5fd8d2a95a8858a233496dddaf6200309f'
            '757b656ae79d5434222143221700a193593a5f07ca6b1ce0104fb167c0ef6590'
            'af7fcf80a4d5f12c29eb1c442194de7635947657ed51cccc0c4e3d14dee3add6'
            '355d9ea34b8773a8f0705c07fb76c266ba6bb26ab3b877c22a712f20b51b2da6'
            '785f769c6c0d465f79038ec4f4c210025043285c345041667b122296c6b961e1'
            'c07cb7d7fe3b65ffe869aea3e236cb4e68b36f997df39508da6ab051ad1b330f'
            '0434674e57fc3c000ca5b0a496d51bb8f8b6422e24547c8698450fba0e459bcd'
            '75b897d38208c985cbe08443ad9253db04a716066fd92b0d05f2fd2fee32b4ff'
            '7d89448b9cccc0e2309ce34fef37ed85fd08fd2b030422e456fc531ebb1e8f80'
            '3d00eef57374d83a2ffc545c399be1ad45ecacbe197dcf7a108d5d1ced19723f'
            '9ba6731ad99d06b7f2f73bf1a329adee8aa8af2404fbf5d37cf1de9b187cbad5'
            '67ba26228f101ee500ff38e09e05eb2e1cd81fc3a194b7912d0275a58f8f2709'
            '27e2c6ecb27a85e11fa7a568d00845f95332431c14366547e4a8040fc145c940'
            '8ddf45bad073219fa3e0c206585cc318b130c7e5f0465b6cd6ad02918c15e0b5'
            '490fcc3beb3afa41e487b04e178b54e728dd56b3a8ae72aa0f933ecaf294e5e8'
            '9a44b26db5a522ccd8497efa77f560516fa6dc709d894916687d0e7a58e6a1ef'
            '1c923ea686ccb440dad2478131ee13529cfa757de45b1b3dcb2e090407f6c118')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]="dav1d libdav1d.so"
  [ffmpeg]=ffmpeg
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  # [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs https://github.com/AOMediaCodec/libavif/commit/5410b23f76
  [libdrm]= #libdrm # libdrm.so
  [libjpeg]="libjpeg libjpeg.so"
  [libpng]="libpng libpng16.so"
  #[libvpx]=libvpx
  [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so"
  [libxml]="libxml2 libxml2.so"
  [libxslt]="libxslt libxslt.so"
  [opus]="opus libopus.so"
  # [re2]="re2 libre2.so" # needs libstdc++
  [snappy]=snappy # libsnappy.so # needs libstdc++
  [woff2]="woff2 libwoff2dec.so" # needs libstdc++
  [zlib]=minizip # libminizip.so
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

_update_sources() {
  python makepkg-source-roller.py update "v$pkgver" "$pkgname"
  updpkgsums
}

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop

  cp -r chromium-mirror_third_party_depot_tools depot_tools
  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Putting together electron sources"
  # Generate gclient gn args file and prepare-electron-source-tree.sh
  python makepkg-source-roller.py generate electron/DEPS $pkgname
  rbash prepare-electron-source-tree.sh "$CARCH"
  mv electron src/electron

  pushd src/electron
  patch -Np1 -i ../../std-vector-non-const.patch
  popd

  echo "Running hooks..."
  # depot_tools/gclient.py runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py \
    -s src/third_party/dawn --revision src/gpu/webgpu/DAWN_VERSION
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles
  depot_tools/download_from_google_storage.py --no_resume --extract --no_auth \
    --bucket chromium-nodejs -s src/third_party/node/node_modules.tar.gz.sha1
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  # Use system java
  mkdir -p src/third_party/jdk/current/bin
  ln -sfn /usr/bin/java src/third_party/jdk/current/bin/
  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  ## Upstream fixes

  patch -Np1 -i "${srcdir}/add-some-typename-s-that-are-required-in-C-17.patch"

  # Revert addition of compiler flag that needs newer clang
  patch -Rp1 -i "${srcdir}/REVERT-disable-autoupgrading-debug-info.patch"

  # GCC13 patches for chromium (https://github.com/archlinux/svntogit-packages/commit/470e5cbc7b58b4955664cdae386161d22c17d980)
  patch -Np1 -i "${srcdir}/random-fixes-for-gcc13.patch"

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Fix build with libxml2 2.12
  patch -Np1 -i ../libxml2-2.12.patch

  # Fix build with ICU 74
  patch -Np1 -i ../icu-74.patch

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    third_party_dir="third_party/$_lib"
    if [ ! -d "${third_party_dir}" ]; then
      third_party_dir="base/${third_party_dir}"
    fi
    find "${third_party_dir}" -type f \
        \! -path "${third_party_dir}/chromium/*" \
        \! -path "${third_party_dir}/google/*" \
        \! -path 'third_party/harfbuzz-ng/utils/hb_scoped.h' \
        \! -regex '.*\.\(gn\|gni\|isolate\)' \
        -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  cd src

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'is_component_ffmpeg=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}"
  ninja -C out/Release electron electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=34.0.0
_gcc_patches=132
pkgrel=1
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
         libpulse libpulse.so
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
             libva
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs which is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-iron
             npm
             patchutils
             pciutils
             pipewire
             python
             python-requests
             qt5-base
             rsync
             rust
             rust-bindgen
             wget
             yarn)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/$_gcc_patches/chromium-patches-$_gcc_patches.tar.bz2
        # Chromium
        compiler-rt-adjust-paths.patch
        blink-fix-missing-stdlib-include.patch
        # Electron
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        jinja-python-3.10.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=132.0.6834.83
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v20.18.1
        chromium-mirror_third_party_engflow-reclient-configs::git+https://github.com/EngFlow/reclient-configs.git#commit=955335c30a752e9ef7bff375baab5e0819b6c00d
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=3c0acd2d4e73dd911309d9e970ba09d58bf23a62
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=8e31ad42561900383e10dbefc1d3e8f38cedfbe9
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=cec7f478354a8c8599f264ed8bb6043b5468f72d
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=5b01ea4a6f3b666b7d190e7cb7c31db2ed4d94ce
        chromium-mirror_third_party_llvm-libc_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libc.git#commit=ca74a72e2b32ad804522bbef04dfe32560a10206
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=eb21edc44e8e5a82095037be80c8b15c51624293
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=6944e6b79dbd1b9776681c025bd4f4c281bb4791
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=9616efc903b7469161996006c8cf963238e26503
        chromium-mirror_testing_libfuzzer_fuzzers_wasm_corpus::git+https://chromium.googlesource.com/v8/fuzzer_wasm_corpus.git#commit=1df5e50a45db9518a56ebb42cb020a94a090258b
        chromium-mirror_third_party_accessibility_test_framework_src::git+https://chromium.googlesource.com/external/github.com/google/Accessibility-Test-Framework-for-Android.git#commit=4a764c690353ea136c82f1a696a70bf38d1ef5fe
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=ce13a00a2b049a1ef5e0e70a3d333ce70838ef7b
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=6ea6ec78f9e4998d0a7a5677b2aec08f0ac858f8
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=93f12c117a4e1c0cc2b129dcc52e84dbd9b84200
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=73dbf565079c89a531e6e01c4e8fc048a8a9660b
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=00fe003dac355b979f36157f9407c7c46448958e
        chromium-mirror_third_party_google_benchmark_src::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=761305ec3b33abf30e08d50eb829e19a802581cc
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=571c76e919c0c48219ced35bef83e1fc83b00eed
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=47f7823bdf4b1f39e462b2a497a674860e922e38
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=fbc5e98031e1271a0a566fcd4d9092b2d3275d05
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=b91cf840ac3255ef03b23cc93621369627422a1a
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_chromium-variations::git+https://chromium.googlesource.com/chromium-variations.git#commit=c170abb48f7715c237f4c06eaed0fe6f8a4c6f8d
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=8df44962d437a0477f07ba6b8843d0b6a48646a4
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=d3d60ac6e0f16780bcfcc825385e1d338801a558
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=554629b9242e6ae832ef14e3384654426f7fcc06
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=ae6f165652e0ea983d73f5d04b7470d08c869e4f
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=41d43a2a2290450aeab946883542f8049b155c87
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=f2f3682c9db8ca427f8c64f0402cc2c5152c6c24
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=b396a6fbb2e173f52edb3360485dedf3389ef830
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_fast_float_src::git+https://chromium.googlesource.com/external/github.com/fastfloat/fast_float.git#commit=3e57d8dcfb0a04b5a8a26b486b54490a2e9b310f
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=591ae4b02eaff9a03e2ec863da895128b0b49910
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=8db59321d9f02cdffa30126654059c7d02f70c32
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=14d466b30a8ab4a9d789977ed94f2c30e7209267
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=822dab21d9995c5cf942476b35ca12a1aa9d2737
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=0ae7e607370cc66218ccfacf5de4db8a35424c2f
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=1da053e87f0487382404656edca98b85fe51f2fd
        chromium-mirror_third_party_ink_src::git+https://chromium.googlesource.com/external/github.com/google/ink.git#commit=4300dc7402a257b85fc5bf2559137edacb050227
        chromium-mirror_third_party_ink_stroke_modeler_src::git+https://chromium.googlesource.com/external/github.com/google/ink-stroke-modeler.git#commit=0999e4cf816b42c770d07916698bce943b873048
        chromium-mirror_third_party_instrumented_libs::git+https://chromium.googlesource.com/chromium/third_party/instrumented_libraries.git#commit=bb6dbcf2df7a9beb34c3773ef4df161800e3aed9
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=955936be8b391e00835257059607d7c5b72ce744
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=a2f139e9123bdb5edf7707ac6f1b73b3aa5038dd
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=d144031940543e15423a25ae5a8a74141044862f
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=ba7ed88cc5ffa428a82a0f787dd61031aa5ef4ca
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=23e35d792b9154f922b8b575b12596a4d8664c65
        chromium-mirror_third_party_libFuzzer_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/compiler-rt/lib/fuzzer.git#commit=a7128317fe7935a43d6c9f39df54f21113951941
        chromium-mirror_third_party_fuzztest_src::git+https://chromium.googlesource.com/external/github.com/google/fuzztest.git#commit=0021f30508bc7f73fa5270962d022acb480d242f
        chromium-mirror_third_party_domato_src::git+https://chromium.googlesource.com/external/github.com/googleprojectzero/domato.git#commit=053714bccbda79cf76dac3fee48ab2b27f21925e
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=be60f06ab420d6a65c477213f04c8b0f2e12ba2e
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=1cdeff7ecf456492c47cf48fc0cef6591cdc95da
        chromium-mirror_third_party_crabbyavif_src::git+https://chromium.googlesource.com/external/github.com/webmproject/CrabbyAvif.git#commit=c3548280e0a516ed7cad7ff1591b5807cef64aa4
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=8e87a6e51c93e7836ecdbcc0a520c7992f3ece13
        chromium-mirror_third_party_beto-core_src::git+https://beto-core.googlesource.com/beto-core.git#commit=89563fec14c756482afa08b016eeba9087c8d1e3
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_speedometer_v3.0::git+https://chromium.googlesource.com/external/github.com/WebKit/Speedometer.git#commit=8d67f28d0281ac4330f283495b7f48286654ad7d
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=9129cf4b2a5ca775c280243257a0b4856a93c7fb
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=ad78bb591d02162d3b90890aa4d0a238b2a37cde
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=624da0f593bb8d7e146b9f42b06d8e6c80d032a3
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=927aabfcd26897abb9776ecf2a6c38ea5bb52ab6
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=000edd791434c8738455f10e0dd6b268a4852c0b
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=727319a77ffe68e9aacb08e09ae7151b3a8f70a3
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=26d9f667170dc75e8d759a997bb61c64dec42dda
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=845d5476a866141ba35ac133f856fa62f0b7445f
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=6ac7c8f25170c85265fca69fd1fe5d31baf3344f
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=13434b50dcb64a482cc91191f8cf6151d90f5465
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=f477acb1049f5e043904b87b825c5915084a9a29
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=478e5ab3eca30e600006d5a0a08b176fd34d3bd1
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=cb6fd42532fc3a831d6863d5006217e32a67c417
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=288d3a7ebc1ad959f62d51da75baa3d27438c499
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=84a8011ec69d0e2de271c05be7d62979608040d9
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=ea011a2c2d3aecdc4f1674887e107a56d2905edd
        chromium-mirror_third_party_protobuf-javascript_src::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf-javascript.git#commit=e34549db516f8712f678fcd4bc411613b5cc5295
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=560c60d342a76076f0557a3946924c6478470044
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=413da873d93a03d3662f24b881ea459a79f9c589
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=6dcd83d60f7944926bfd308cc13979fc53dd69ca
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=c08ec529fc91722bde519628d9449258082eb847
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=c17fe9bc158c29de3cdd655ac73d14f52c17810a
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=c9f9edf6d75bb065fa47468bf035e051a57bec7c
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=567495a62a62dc013888500526e82837d727fe01
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=d5c4284774115bb1e32c012a2be1b5fbeb1ab1f9
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=658227d3b535287dc6859788bde6076c4fe3fe7c
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=0b56dd5952b25fad65139b64096fcd187048ed38
        chromium-mirror_third_party_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=9c644fcb5b9a1a9c975c50a790fd14c5451292b0
        chromium-mirror_third_party_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=b8fcf307f1f347089e3c46eb4451d27f32ebc8d3
        chromium-mirror_third_party_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=996c728cf7dcfb29845cfa15222822318f047810
        chromium-mirror_third_party_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=9117e042b93d4ff08d2406542708170f77aaa2a3
        chromium-mirror_third_party_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=cbcad3c0587dddc768d76641ea00f5c45ab5a278
        chromium-mirror_third_party_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=b0177a972b8d47e823a4500cf88df88a8c27add7
        chromium-mirror_third_party_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=15f2de809304aba619ee327f3273425418ca83de
        chromium-mirror_third_party_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=87ab6b39a97d084a2ef27db85e3cbaf5d2622a09
        chromium-mirror_third_party_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=bc2c38412f739c298d6f5c076c064e6b5696959f
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=56300b29fbfcc693ee6609ddad3fdd5b7a449a21
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=a156431ea66fe67d69c9fbba8a8ad34dabbab81c
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=7d5a3a8b494ae44cd9651f9505e88a250082765e
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=450cceb587613ac1469c5a131fac15935c99e0e7
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=b9f32fd2943dd2b3d0033bf938c9d843f4b5c9a9
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=afaf497805cbb502da89991c2dcd783201efdd08
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=e3f919ccfe3ef542cfc983a82146070258fb57f8
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=ccf29cb237c3ed09c5f370f35239c93d07abfdd7
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=d1d33679661a34f03a806af2b813f699db3004f9
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=a926d0a32e02c4c03ae95bb798e6c780e0e184ba
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=7fb5347e88f10472226c9aa1962a148e55d8c480
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=e51f1d7dbd113aa01ddfb30890c8a89b11fcd96c
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=f674555ab03e6355e0981a647c115097e9fe5324
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=9cac81256beb5d4d36c8801afeae38fea34b8486
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=9d5c32282de17517d92763af2d11dbeb1f6539aa
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=53554bf3da41153f2e01f9ff234c194c156b7a93
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=1bd0da6657e330cf26ed0702b3f456393587ad7c
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=e2d024354e11cc6b041b0cff032d73f0c7e43a07
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0bad08bb207bbfc1d6f3bbc82b9242b0c50e5794
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=b35641f4a3c62aa86a0b3c983d163bc0fe36026d
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=209717dd69cd62f24cbacc4758261ae2dd78cfac
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=f81f6c011baf9b0132a5594c034fe0060820711d
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=ac36a797d3470e8ee906b98457a59270d01db30d
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_webgpu-headers::git+https://chromium.googlesource.com/external/github.com/webgpu-native/webgpu-headers.git#commit=8049c324dc7b3c09dc96ea04cb02860f272c8686
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_protobuf::git+https://chromium.googlesource.com/chromium/src/third_party/protobuf.git#commit=da2fe725b80ac0ba646fbf77d0ce5b4ac236f823
        chromium-mirror_third_party_dawn_tools_protoc_wrapper::git+https://chromium.googlesource.com/chromium/src/tools/protoc_wrapper.git#commit=b5ea227bd88235ab3ccda964d5f3819c4e2d8032
        chromium-mirror_third_party_dawn_third_party_jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=69098a18b9af0c47549d9a271c054d13ca92b006
        chromium-mirror_third_party_dawn_third_party_langsvr::git+https://github.com/google/langsvr.git#commit=303c526231a90049a3e384549720f3fbd453cf66
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=2e6b2efb6f435aa3dd400cb3bdcead2a601f8f9a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        # END managed sources
        )
sha256sums=('b3620e57fb5dca017015d89e1b3a737d20d682432ad8d10fa969f9081eedef9f'
            '40cd0f3cc33adf19c7413a35d4a48c24f1b2507e9c12f1b29cf6573ad1b9148d'
            'b3de01b7df227478687d7517f61a777450dca765756002c80c4915f271e2d961'
            'a4a822e135b253c93089a80c679842cc470c6936742767ae09d952646889abd6'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '13fcf26193f4417fd5dfbc82a3f24e5c7a1cce82f729f6a73f1b1d3a7b580b34'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '2c8cd28cee0e1df1862e801794f210d2b7cac652f943cf94f43c2abe26f2a2f4'
            '7a313802c44a16c3ce1b503946335c211a800a94262209028bf794f116fc0fbe'
            '0b7a546ee6913c49519c10c293ac530ff381641a8a465fa2e184d6dbe0fb784d'
            '07dc86368ae75c7605ef15ab9b95db07bdb53840b7ff5ccf8dc6014e13dcafcf'
            '3522166c3ca75316a172b7cc4fe12bba9367e30fed16df8193ede2e236dca8c5'
            'b7ab26b28122102827dbbefa54a38f9d59729bbdab889dcc6dba672141590717'
            'ca032b6efa176ea66f16383dfbba5a5b78bb81727246a607bce6e1254466a5aa'
            '55970924b50cd67b3cf654b61ac1ecab603e0f9a46d4fb3c14f6d8e886713975'
            '541fcab06c22d6b9b3b2d0b315f74f2a4cd8c6e7f8ec6cf97b231c11e95fe34d'
            '7f1f2752dbae079497e491300b3f5777f48e27b04e98d43aa0b1ded5591305bd'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            '4d6164564f1fb641cb190966bf525a9d9ed5f30a09ee9d1d37e1d65624b09304'
            'b344c098926ab34bb1006f8dfaa8d2ebed9b9b62e77bb42aa689e4bf63093ece'
            '5898da9dfc8b9e9bc391873f50c3bd5bafe08c5cbbdbca1a73f8d61ed9a18a75'
            'ac11276705c1b69fcc75a4842338824ed21a22399f24a56874fc0adc27cfc4e7'
            'de6dba1f7c67cb568c5f23e75a994422944ce46c01fc35bddae4ebc023a7145a'
            'f7bb04f817f30c81014fe43a4cdf393606f8b54f7c0d8c9bfcfffef3d2d244be'
            '0e3ece6abcb4942e0c027294a23d689ff9dce5aacd8e958fdddc0f20d9873765'
            '89a368f0652d857d38402d6f3c5cded3c1757230ab7abe01df850a7bf8359119'
            '6c4b7c3e16840a3c2c4c1457343d36a4b42ce81af77833b8645c3519a732bb45'
            '911b6de375ef2b50a4896d12bd4811cc777f918204ae698ecf5fa45afdf72628'
            '5f359dae10e80599f26483879b879d7a6808520d4a56c98ee0879373a6339619'
            'd60bd46ce7eb2531b4b36edc4c77a64600736547ade44b5c64c87aee11731dfb'
            '98c94ee6061cbbd2a99f37ecd4801ead0c8d77eab36aa749e3e52eb3c3f4c530'
            'c2832b38bee2ad86c1528bf6578906a669e2bbebe34117634d32aee9f57a47d1'
            'cdae148ab29e40b686bb56d1da689dbc376c6a4b467fbb6d39e6bcb4b59ed4a5'
            '1c8e9adfcf4fe41b48457f6fbd7f380831836e8cdd2e4605a5d306ae49b702aa'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            '3e56a0ee93a480a836339bf1744b33500e14db2282f1b6c217fa8a660240e3fa'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            '6125206b56f365874ba812038dbcd4271f8a73235ab4d211c42b7fd2d636bbc8'
            'b7d0e4e50b90b6ebb1bcd62898cbc813f76a960f90a6034ec2080aa691ea25ec'
            '6ae7ae01b3c23f8bf7657a59427aac6f3216e041ebdb983b82c002a949bdb071'
            '18d5dc3c0161071d033d67972239f2ea86fd6cfdeb384ba591961d4cb9c3a7ce'
            '8ddf66e53816a3f59a9bc99c36ccbef95e2f9d0827cf637f30ccf433f392def3'
            '1ed5102925b7d28ea7928e5b563d7ed396c18234e306ac1588b36746ffadf62e'
            '3845b1166bb0e882b3e12a8c67965a51faf66cdb23e160d2b01193943b59cc77'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '85caa5a8fde78bfb707e078930dad94ca39d5a0e4575bc96a2e8845df8af2be8'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            '64ba2842c41f7f9cffaf13269cb1a6b64211bbb02b65ae0aba0d93caca1627ef'
            '4699f11f75b250202174040837b9240d765209f139954e45642c244b5b398655'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            '7df2a26df1b8e69c58692295443e18de9f19bc0107bd5911beed53157a592ad3'
            '0db8417b0fd669b95227c266cbc578af1f5e00198fd24f51fee8cfcfccb8b06b'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '792d29bbb3fdcfdf21face515e6b9fba1a14ee7bdc82f0cff9620592925425c9'
            '9a19ab636d35daa682857afc061e4f2e676715862bc63983d5bf3577081bd9e4'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'd0697f71f188829bcb9e98b229340ea77ee1c5185a02168ac509fbd5c02e7b1b'
            '7fbc8404e889753152af9ffe3a5e68a8ae4a598f878bb672b119c745ad5e5078'
            'ed1d70be45736383da22f440847d9c256d711a209d85624caba7b16b07a04642'
            '753cb94b49f25fd25aa045569722d4780591bf060f17644d9b78e7e83b3fdfc8'
            '66004b44318ad7e4329d65b08320136ee8a9f074b7b001107c52377493d28cc0'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '6ae17c7b6b1a897550f3b099f4f8f1ca84eb41c3f1d7711d43359040a5450495'
            '1ec8fdcff95801cadc273f02aa9a33246ea8106c7b7480151188f7e1382f5aef'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '0f219741c90cddba0b442fdbc16c5d1e968bbdf633b8267e132d1a91292cef36'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '739e5654f283ec4d5bf2a54f4d13d4979a92cfb035b407e6736d58203c3a4266'
            '6b7271b65f0e2cd4ebf81e1184f0e8900d13dbc134839f223587318c4d842378'
            '59da6a77234770db03204f83967353a58a50e67ebde3b3fed855b54ff3c59294'
            'c2eb3aee5d91aa9d80d651d5bc26ae729e9a5bdd2f62985ca394cebac5b8174f'
            '63e3cc92fb9b5b9181082eb8ba1574a11e4c36272d10930c4bd7610fed17308a'
            '84378a4fe8c0433bf365f088283c001a5576f10c1bcaf2e24ce3fb14ff81cb4e'
            '847bd0ead3c123af9fe62750905a9e446124d46b702cba38e679c151a49339a5'
            '795f4f258a0ea9e1e6e0491049acc21a8505530f129d646ba8cb0af967859834'
            '14c6c83927ca1685579c2eb320f9d9bf6a7deadba923d53c65fdc466992ce87b'
            'ac36790b054f2b0fbc5bcb64951ee2f77201d3795d5ccf590adc78b5bc7cb6e2'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            'f849a0242720e6389140b7d7853e9f56186bac9793aea5e7b9b713d76847c398'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            'bfc7bf02a1e2a7dd1e85a0944b5b23a94ba8eff453bcce6fa53c511a9d8aac0b'
            'ae2c189d21dcd056116ee1c3d54b5ae3874e5ac0cc2086c137625b618334cbb1'
            'dd3fe1521ff5bc4481bfd447d62322417f069371d107d5df2df8134b0a1bfd79'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            '3bb4ad9e05483ad8cadd9bf9d7ca0e2e16fd4eb1495ef36f4858be22c2eb31b2'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '1e7f1fbf8818b35e61f32ed2c6bc0e8808e53ab87f45c8aa6df35daf3f14b720'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            'a3753567458a1abea7ece15c9cb76ceb875ee717a159b1abe470a8c6ba052eb7'
            '77e3ec7142195e044be4662611f6c31407ae8486dcaa7bd1bd03bb1315250cb2'
            'c06f2a92cd606654ec565c2fa728e755eaaf7e7a41fb7bd217988274a411c320'
            'abd99d4eab894c78d8cb20e275258fcc2fd016d9fbb2c3f7b0b6f5832deff890'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'f2aba031573fc4929d2bd9d03e4b18c4385f399fa0b605eca35898567ebdf7b4'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '3d55fa9e1d628aed3e127b6fb4d3dd47b7ada7b865f683f52e21a51043827479'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            '3cd40fbd2ac25f213a6c26c1e86d9644fce7423368149fb22c71e004ca6c9553'
            '191b408be2ac0bd13f0f612b5b9eaf49b8996e4261a82c7844438f5c79acc92d'
            '737a2b60713f602b487a67a49c8817d5423218d546943cfe49a57e50c2101d89'
            '215b0aaf87f6524b5cd2ea443c5fb43d6a8676693f70e1656a534f4c41cd5034'
            '85b737aa68c5cd74a8ac9947d073d097439bf08e960246e774fdd1def55178cf'
            '78f5096d2d425b9663cb289964d994c9a15db7938c5a1a35cc4b286014ca2545'
            '00f4fa0ff1741c69c12af0c14a8c60b0b3a28e44c04beee3d61fc7982a6aea5d'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            '215cb74a45a6df118ec77d96848ea7dce7885f1a4be401c4e11cb8f8c32f4078'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            'b7a7a43eae0f41a9e18f54c2334d5797a547238b76d64d59ede26a4d6621de0d'
            '39d7dd8b6721a427dae2ca577d5f003459563928850757c519be96cb4064e933'
            '854ceb7b08b956a2e5f03f8ec34ab312adeb241f20c64a3deb1dffbfa4e5b32f'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'bd724ee01b93651b4ec6ba62ba64d23e153ea7100be760ccaee4a1e6e32787a6'
            '1a94dc238b495ea06f98e8876591691eddfc41e3980b84624fd0834add444afb'
            'c4a0e3d17dcff9f9f7db4ee0acbbabd65cc642c444571a6e49082e028a10b636'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            '24fdcd1f936c64169b4583b6a45564512697b1ef0510020ef0ba6e73a8e98dc9'
            '1774b85f2099b022bed7c53c5dbcc2471ec0d395b644a8c80d341f8951a0c677'
            '0d70554416ac91c6036ce8ec9cd81ece3495cdcfd7ada8cd102f0eb71c3f2dde'
            '0f18fde832017387600b5ee2ec6a0ae82125c82b97c0f717772f3cd5dfdcd57b'
            '3e20b42c5c8c1dd2d41a94a86a041c969ac31a239692fd9cd7b07467c1b32324'
            '99d8dd5d967a905e0448875d69a63d3a64491aaae2dcba1fba271319c24c7b46'
            'f33b0b1dea3bf4f6ddebb6664ccbdc2bd6ed600f1cc430ff3f31e2d214d1dfb0'
            'a427cb03b60111e2ba53200486b3ea35277ab6ffc06cfc83f67c25140c73ff85'
            '602fcfd3d0d688ec8affb1b10a6380f6246cb28a50a5af7470e0c82e294ae13d'
            '6f2c55ce7750c6a49dbaf91a175da7f17f457fde0991233325279cdf31eead5d'
            'b55ecae0dc64fe457f8f6d60b8ed5cbba2619e1315504e64fd5975221a6fd706'
            '913fc3a85ae676025bafe63880c6413ffafe42495a04a52527ee914ee9ba3ae5'
            '8ee0bade4127e082dc1ae86f0068aa32ea0fbce26069ed2d9dbdef324e1bb980'
            '900f9249e65a3bf0189f3e32c6a2d84bd88b9b3a7d7cfba8c12c1be0d78dd31f'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            'ac3a122bf70f773c7a7dbc562c5e2d7a7c90c5a2d4b3909f3ad3a9263e56842c'
            '4c7225fff41aa9710457ada40815d319582a8543097dec1b983521311a6200d1'
            '9a8f6f6448b377499cf00ea76ade11a3fac08e407783f02ec3cc2956e21c3b2a'
            '0c9106a2bef658f02b2312d081faad6ba8a72bbb5b4ee1cae7d0a95e4ef53f8f'
            '04a61e218b3a10ec3cf58e3fe12fb2ea23610f03889d19b31b8ccb3b078efd6e'
            '910bc5d9e7523ccd09506bafe3fac586db5106d8cc72d77e8457fdf8b43c225e'
            '66f9831c5b862799e3f6b30cab3bd03aab4478152c788d79d87f4a8a3dfaaf6a'
            '548c8cd89cf822c790e4703eff53756791450eba73d267a84f3bf3eedf60bef5'
            'd65d6c95f723bb5336966f2ccce61edd0da1f135f759f112a5ad9fe41eec64ad'
            '213eea44f7dfaf84f2aaf5f3fa99a71e4053f2cbe3ca9d8acbcbecce16425db4'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '322201573e33e44fe34c6a27b4c940135d8fe8e44047750cc6ebd8b6e06f5ae8'
            '2a4e7b307dd0c1b88608e60e13a6ae0baf0995765f896f5b622cdc3d067e42d2'
            '2056ba4afad1c94ac34175b1a0556744f178406c3e93cff132aab00201ecd4f0'
            '2c104a092b2d8e79ba9aa844af6fd8daf7d78def78146568a3cd0501ebd9d3f9'
            '64633f7373b79cb3e3a7c221f1a8a6033ea6d14fc3234fdb52facc4c1ab2fb24'
            'b48490fbcdad8becc160f2dab2ee4a0f67327f1e9d9ddbd96e44150175c68ca9'
            '0b95ed21612b4f02e65643f2029d8ce5710f49dbe8b229350bbe643167a4b83b'
            '9bd1e05f5128b4715c2d354a6895839d01aae4fc9f56b9d0411afc87fb46daf4'
            '3ae63a893b5b585823f04b5a2e604d3df4c7c6e311f5da5b5d5af92a1fd00465'
            'd1bea5be4ca41f2e9f29354bc3bdf12d9bba47778eb6fa6b01db053a831f3b42'
            'd2def993a48b3edd8ee6b8dafc63b85b230bc05bb75aa895c8a1000626e1f84e'
            'f7f5d15365443cbd8137445c3aedf8ccd31c3402f72c0fa7c16e7bf1c7977139'
            'b4b2001119694d538dd97c110809503d8ac514caba65f98d11be7ae00c307299'
            'f8627f5f3a7c119807afc9dc66ce7cb350f905fd1db7fb6b0077552974a07515'
            'ac3f025aa27fec77b24b443df3a69750dc9bb070a40af5180d031b81e66e328c'
            '9c09dfbb8ebed025ec8ba34bf95c80fe30dd69eee5a02945c0357ce253d9dcbc'
            '8bd1361cf5c6e4e3336cad5b37c79dcc986a46b99e4ad7d679da146dd1fdb7fe'
            '868159a9a965cebd40f98f5995d6ac6361869904712c1b62c6b8a67d10dd93b4'
            'bde40f830d8edac53f2682acd50bf7db2632cb31c6ddaa1923a8703a58899e11'
            '37bd9bc812c1bfc471be2eb003f714e475f8425913c42703b21237f2b1c99e57'
            'c23fa31250811a76be900554b9ac127f861ebde09c07ac67cd6b82dd214e5686')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  # [dav1d]="dav1d libdav1d.so"
  # [ffmpeg]="ffmpeg libavcodec.so libavcodec.so libavformat.so libavutil.so" # YouTube playback stopped working in Chromium 120
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  # [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  # [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg-turbo libjpeg.so"
  [libpng]="libpng libpng16.so"
  # [libvpx]=libvpx
  # [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so" # //third_party/libavif:libavif_enc needs //third_party/libwebp:libwebp_sharpyuv
  [libxml]="libxml2 libxml2.so"
  [libxslt]="libxslt libxslt.so"
  [opus]="opus libopus.so"
  # [re2]="re2 libre2.so" # needs libstdc++
  # [snappy]=snappy # libsnappy.so # needs libstdc++
  # [woff2]="woff2 libwoff2dec.so" # needs libstdc++
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
  #export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Putting together electron sources"
  # Generate gclient gn args file and prepare-electron-source-tree.sh
  python makepkg-source-roller.py generate electron/DEPS $pkgname
  rbash prepare-electron-source-tree.sh "$CARCH"
  mv electron src/electron

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
  # needs newer clang to read the bundled PGO profile
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles

  # https://gitlab.archlinux.org/archlinux/packaging/packages/electron32/-/issues/1
  src/third_party/node/update_npm_deps

  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  # https://github.com/nodejs/node/issues/48444
  export UV_USE_IO_URING=0

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  patch -Np0 -i ../blink-fix-missing-stdlib-include.patch

  ## Upstream fixes

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../chromium-patches-*/chromium-130-interference-size.patch
  patch -Np1 -i ../chromium-patches-*/chromium-132-compiler.patch

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sfn /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  mkdir -p third_party/jdk/current/bin
  ln -sfn /usr/bin/java third_party/jdk/current/bin/
  ln -sfn /usr/bin/clang-format buildtools/linux64

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  # patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
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
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=false'
    'enable_nacl=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  local _clang_version=$(
    clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

  _flags+=(
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    "clang_version=\"$_clang_version\""
    #'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
  )

  # Allow the use of nightly features with stable Rust compiler
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
  export RUSTC_BOOTSTRAP=1

  _flags+=(
    'rust_sysroot_absolute="/usr"'
    'rust_bindgen_root="/usr"'
    "rustc_version=\"$(rustc --version)\""
  )

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
